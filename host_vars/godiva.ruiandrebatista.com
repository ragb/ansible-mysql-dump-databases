mailserver_main_domain: ruiandrebatista.com
mailserver_hostname: mail.ruiandrebatista.com

mail_virtual_domains:
  - name: "ruiandrebatista.com"
    pk_id: 1
  - name: "nvda.pt"
    pk_id: 2

mail_virtual_users:
  - account: ragb
    password_hash: "$6$PL4blpDp5ul8kir.$ECdbAZrlgrdRIQY5tlvsXAXqS.gGHFnYyrZr9R84Dg5PXVgAqhH22e9vgAqUTm1UG7mIVxcE3HlCTFBh46m1q1"
    domain_pk_id: 1
    domain: ruiandrebatista.com


mail_virtual_aliases:
  - source: mail@ruiandrebatista.com
    destination: ragb@ruiandrebatista.com
    domain_pk_id: 1
  - source: traducoes@nvda.pt
    destination: ragb@ruiandrebatista.com
    domain_pk_id: 2
  - source: artigos@nvda.pt
    destination: ragb@ruiandrebatista.com
    domain_pk_id: 2
  - source: mail@nvda.pt
    destination: ragb@ruiandrebatista.com
    domain_pk_id: 2






mailserver_certificate: "{{lookup('file', 'certs/dovecot/dovecot-cert.pem')}}"
mailserver_certificate_key: "{{lookup('file', 'certs/dovecot/dovecot-key.pem')}}"


webserver_sites:
  - name: www.ruiandrebatista.com
    directory: www.ruiandrebatista.com/htdocs
    owner: ragb
    group: www-data


docker_static_nginx_containers:
  - name: www.ruiandrebatista.com
    virtual_host: www.ruiandrebatista.com
    root: /srv/www/www.ruiandrebatista.com
    count: 1
  - name: ruiandrebatista.com
    virtual_host: ruiandrebatista.com
    root: /srv/www/ruiandrebatista.com
    count: 1

ragbshortener_virtual_host: url.ruiandrebatista.com

ragbshortener_virtual_port: 5000

