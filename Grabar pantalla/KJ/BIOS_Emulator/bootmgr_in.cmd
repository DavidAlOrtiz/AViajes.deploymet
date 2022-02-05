@echo off

for %%A in (C: D: E: F: G: H: I: J: K: L: M: N: O: P: Q: R: S: T: U: V: W: X: Y: Z:) do (
	if exist %%A\bootmgr (
		if not exist %%A\setup.exe (
                        echo.

                        if exist %%A\grldr    attrib %%A\grldr -h -s -r
                        if exist %%A\win7.ld  attrib %%A\win7.ld -h -s -r
                        if exist %%A\SLIC.BIN attrib %%A\SLIC.BIN -h -s -r
                        if exist %%A\SLIC.IMG attrib %%A\SLIC.IMG -h -s -r
                        if exist %%A\grldr    del %%A\grldr
                        if exist %%A\win7.ld  del %%A\win7.ld
                        if exist %%A\SLIC.BIN del %%A\SLIC.BIN
                        if exist %%A\SLIC.IMG del %%A\SLIC.IMG
                        if exist %%A\bootmgr.bak attrib %%A\bootmgr.bak -h -r -s
                        if exist %%A\bootmgr.bak del %%A\bootmgr.bak
                        takeown /f "%%A\bootmgr.">nul
                        icacls "%%A\bootmgr." /grant *S-1-5-32-544:F >nul
			attrib %%A\bootmgr -h -s -r
			ren %%A\bootmgr bootmgr.bak>nul
                        timeout /t 1 /nobreak>nul
			copy data\bootmgr\bootmgr /b  %%A\bootmgr /b>nul
                        timeout /t 1 /nobreak>nul
			attrib %%A\bootmgr +h +s +r
                        if exist %%A\bootmgr.bak attrib %%A\bootmgr.bak -h -r -s
                        if exist %%A\bootmgr.bak del %%A\bootmgr.bak
			if exist %%A\bootmgr.bak attrib %%A\bootmgr.bak +h +s +r

		)
	)
)

cls