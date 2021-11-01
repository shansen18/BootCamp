GoodSecurity Penetration Test Report

[ScottHansen\@GoodSecurity.com](mailto:YOURNAMEHERE@GoodSecurity.com)

October 25 2021

1.  # High-Level Summary

GoodSecurity was tasked with performing an internal penetration test on
GoodCorp's CEO, Hans Gruber. An internal penetration test is a dedicated
attack against internally connected systems. The focus of this test is
to perform attacks, similar to those of a hacker and attempt to
infiltrate Hans' computer and determine if it is at risk. GoodSecurity's
overall objective was to exploit any vulnerable software and find the
secret recipe file on Hans' computer, while reporting the findings back
to GoodCorp.

When performing the internal penetration test, there were several
alarming vulnerabilities that were

identified on Hans' desktop. When performing the attacks, GoodSecurity
was able to gain access to his machine and find the secret recipe file
by exploit two programs that had major vulnerabilities. The details of
the attack can be found in the 'Findings' category.

1.  # Findings

Machine IP:

192.168.0.6

Hostname:

MSEDGEWIN10

Vulnerability Exploited:

Icecast Header Overwrite (metasploit exploit/windows/http/icecast_header

Vulnerability Explanation:

During our investigation we found that this comoputer was subject to a
buffer overflow exploit that allows an attacker to remotely gain control
of the system, using the Icecast service on port 8000. This explopit
operated by over writing the memory on the affected system.

Some actions that an attacker may take on a vulnerable system are:

Key logging

File discovery

Downloading and uploading files and executables to system.

Also found in the discovery process is that this system is also
vulnerable to:

Ikeext Service Exploitation (EXPLOIT/WINDOWS/LOCAL/IKEEXT_SERVICE) which
exploits the ikeext service witch runs as system, and starts
automaticaly in Vista-Win8

Windows Net-NTLMv2 (exploit/windows/local/ms16_075_reflection) this
exploit can be used for privilege elevations.

Severity:

Because of the multiple exploits found, as well as the fact it allows us
privilage escalation, uploading and downloading of files, this would be
classified as a Critical Severity Level.

Proof of Concept:

This is where you show the steps you took. Show the client how you
exploited the software services. Please include screenshots!

There should be a separate finding for each vulnerability found!

1.  # Recommendations

What recommendations would you give to GoodCorp?
