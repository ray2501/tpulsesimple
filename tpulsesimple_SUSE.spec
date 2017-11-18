%{!?directory:%define directory /usr}

%define buildroot %{_tmppath}/%{name}

Name:          tpulsesimple
Summary:       Tcl bindings for PulseAudio simple API
Version:       0.2
Release:       2
License:       LGPL v2.1
Group:         Development/Libraries/Tcl
Source:        https://github.com/ray2501/tpulsesimple/tpulsesimple_0.2.zip
URL:           https://github.com/ray2501/tpulsesimple
BuildRequires: autoconf
BuildRequires: make
BuildRequires: tcl-devel >= 8.4
BuildRequires: libpulse-devel
Requires:      tcl >= 8.4
Requires:      libpulse0
BuildRoot:     %{buildroot}

%description
Tcl bindings for PulseAudio simple API.

%prep
%setup -q -n %{name}

%build
./configure \
	--prefix=%{directory} \
	--exec-prefix=%{directory} \
	--libdir=%{directory}/%{_lib}
make 

%install
make DESTDIR=%{buildroot} pkglibdir=%{tcl_archdir}/%{name}%{version} install

%clean
rm -rf %buildroot

%files
%defattr(-,root,root)
%{tcl_archdir}