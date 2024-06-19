# Secure Server Firewall Configuration with iptables

This repository contains a comprehensive iptables firewall script designed to enhance the security of your server against various network threats including DDoS attacks, botnet activities, and unauthorized access attempts.

## Features

- **Initial Cleanup and Localhost Access**: Ensures a clean firewall state and allows traffic from localhost for local services.
- **Blocking Specific IP Ranges**: Blocks known malicious IP ranges to prevent unauthorized access.
- **Allowing Your Own IP Address**: Grants access to your server from your own IPv4 and IPv6 addresses dynamically.
- **Cloudflare IP Ranges**: Allows traffic from Cloudflare's IP ranges to ensure uninterrupted services.
- **Allowing Specific Ports**: Permits traffic on essential ports (SSH, custom services) while blocking unnecessary ones.
- **Blocking Additional Ports**: Restricts access to non-essential ports to minimize attack surface.
- **Custom UFW Rules**: Implements rate limiting and connection limits to protect against DoS attacks.
- **Valve Anti-DDoS Rules**: Manages UDP traffic on Valve game server ports to mitigate DDoS attacks.
- **Advanced UDP Filtering**: Filters UDP packets using advanced techniques (string matching, packet length filtering) to block malicious traffic.
- **OVH Specific Rules**: Provides rules tailored to OVH-related services to enhance security against targeted attacks.

## Usage

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Review and modify the script**:
   - Open **'iptables-script.sh'** and review each section.
   - Modify IP ranges, port numbers, and specific rules to match your server environment.
  
3. **Execute the script**:
   - Run the script with root privileges to apply the firewall rules:
   ```sudo ./iptables-script.sh```

4. **Verify**:
   - After applying the rules, verify that your essential services are accessible and that unwanted traffic is effectively blocked.

## Contributing
Contributions are welcome! If you have suggestions for improvements, open an issue or fork the repository and submit a pull request.

## License
This project is licensed under the License Name Here.

This project is licensed under the [The GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html) License.

