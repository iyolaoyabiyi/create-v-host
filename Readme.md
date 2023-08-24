# create-v-host Script

The `create-v-host.sh` script automates the process of setting up a virtual host configuration file for an Apache2 server. By using this script, users can conveniently generate the required configuration file for their virtual host.

## Usage

1. Ensure the script is executable by executing the following command:

   ```bash
   chmod +x create-v-host.sh
   ```

   This command grants execution permissions to the script.

2. Run the script using the following command:

   ```bash
   ./create-v-host.sh
   ```

   Follow the prompts to provide the necessary information:

   - Enter the domain name, including the top-level domain (e.g., example.com).
   - Specify the document root directory where the website files are located.
   - Enter the email address associated with the domain.

3. Upon completion, the script performs the following actions:

   - Creates a virtual host configuration file within the `/etc/apache2/sites-available` directory.
   - Enables the virtual host by executing the `a2ensite` command.
   - Reloads Apache2 using the `systemctl reload apache2` command.
   - Adds the domain and www alias to the hosts file.

## Requirements

- Apache2 must be installed and operational on the system.
- The script should be executed with root privileges, typically using the `sudo` command.

## Output

Upon successful execution, a confirmation message will be displayed:

```
Virtual host created successfully for example.com
```

Customize the script as necessary before executing it. Please ensure you possess administrative privileges to run the script.

## Examples

Example usage of the script:

```bash
./create-v-host.sh
```

Running this command initiates the script and guides you through the process of setting up a virtual host configuration.