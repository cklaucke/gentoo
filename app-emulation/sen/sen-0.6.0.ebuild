# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Terminal User Interface for docker engine"
HOMEPAGE="https://github.com/TomasTomecek/sen"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="dev-python/urwid[${PYTHON_USEDEP}]
	dev-python/urwidtrees[${PYTHON_USEDEP}]
	dev-python/docker-py[${PYTHON_USEDEP}]
	"
DEPEND="${RDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/flexmock[${PYTHON_USEDEP}]
	)
	"

python_install_all() {
	distutils-r1_python_install_all
	dodoc -r docs
}

python_test() {
	pytest -vv tests || die "pytest failed"
}
