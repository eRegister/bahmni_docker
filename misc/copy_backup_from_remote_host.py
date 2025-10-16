# run crontab on client machine: 00 * * * * python3 /home/openmrs/backups/copy_backup_from_remote_host.py >> /var/log/copy_backup_from_remote_host.log 2>&1 
import paramiko
from datetime import datetime

def execute_remote_script(hostname, username, password, remote_script_path):
    try:
        # Establish SSH connection
        client = paramiko.SSHClient()
        client.set_missing_host_key_policy(paramiko.AutoAddPolicy()) # Be cautious with AutoAddPolicy in production
        client.connect(hostname, username=username, password=password)

        
        # Execute the script on the remote server
        stdin, stdout, stderr = client.exec_command(f"{remote_script_path}")

        # Print output and errors
        print("\nRemote script output:")
        for line in stdout:
            print(line.strip())

        errors = stderr.read().decode()
        if errors:
            print("\nRemote script errors/warnings:")
            print(errors)

        client.close()

    except paramiko.AuthenticationException:
        print("Authentication failed. Check username and password.")
    except paramiko.SSHException as e:
        print(f"SSH error: {e}")
    except Exception as e:
        print(f"An error occurred: {e}")


def copy_file_from_remote(hostname, username, password, remote_path, local_path, port=22):
    try:
        # Create an SSH client
        ssh_client = paramiko.SSHClient()
        
        # Automatically add the server's host key (use with caution in production)
        ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        
        # Connect to the remote server
        ssh_client.connect(hostname=hostname, username=username, password=password, port=port)
        
        # Open an SFTP client
        sftp_client = ssh_client.open_sftp()
        
        # Get the file from the remote server
        print("Downloading Database file from server")
        sftp_client.get(remote_path, local_path)
        
        print(f"File '{remote_path}' successfully copied to '{local_path}'")
        
    except paramiko.AuthenticationException:
        print("Authentication failed. Please check your username and password.")
    except paramiko.SSHException as e:
        print(f"SSH connection error: {e}")
    except FileNotFoundError:
        print(f"Remote file '{remote_path}' not found or local path '{local_path}' is invalid.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
    finally:
        # Close the SFTP and SSH connections
        if 'sftp_client' in locals() and sftp_client:
            sftp_client.close()
        if 'ssh_client' in locals() and ssh_client:
            ssh_client.close()

if __name__ == "__main__":
    now = datetime.now()

    # Format the date as d-m-Y
    formatted_date = now.strftime("%d_%m_%Y")
    formatted_time = now.strftime("%H:%M:%S")

    # Initializing variables:
    REMOTE_HOST = "10.231.60.250"
    REMOTE_USER = "openmrs"
    REMOTE_PASSWORD = "M0Hpa$$01BB"
    REMOTE_FILE_PATH = "/home/openmrs/backups/Botha_Bothe_Hosp_emr_"+str(formatted_date)+".tar.gz"  
    LOCAL_SAVE_PATH = "/home/openmrs/backups/Botha_Bothe_Hosp_emr_"+str(formatted_date)+".tar.gz"          
    REMOTE_SCRIPT_DEST = "/usr/local/bin/backups.sh"

    print("Executing remote backup script to create most recent backups...")
    execute_remote_script(REMOTE_HOST, REMOTE_USER, REMOTE_PASSWORD, REMOTE_SCRIPT_DEST)
    print("Downloading latest backup from remote server at "+str(formatted_date)+" " +str(formatted_time))
    copy_file_from_remote(REMOTE_HOST, REMOTE_USER, REMOTE_PASSWORD, REMOTE_FILE_PATH, LOCAL_SAVE_PATH)