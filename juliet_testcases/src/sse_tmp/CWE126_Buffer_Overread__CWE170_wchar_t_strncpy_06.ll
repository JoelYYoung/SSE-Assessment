; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_06.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_06_bad() #0 !dbg !11 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !15, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !32
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !35
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !36
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !37
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  call void @printWLine(i32* %arraydecay4), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_06_good() #0 !dbg !41 {
entry:
  call void @good1(), !dbg !42
  call void @good2(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #4, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #4, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_06_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_06_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !65 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !66, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !71, metadata !DIExpression()), !dbg !72
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !73
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !74
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !75
  store i32 0, i32* %arrayidx, align 4, !dbg !76
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !77
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !78
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !79
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !80
  store i32 0, i32* %arrayidx4, align 4, !dbg !81
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !82
  call void @printWLine(i32* %arraydecay5), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !85 {
entry:
  %data = alloca [150 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata [150 x i32]* %data, metadata !86, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !93
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 149) #4, !dbg !94
  %arrayidx = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 149, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !97
  %arraydecay2 = getelementptr inbounds [150 x i32], [150 x i32]* %data, i64 0, i64 0, !dbg !98
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %arraydecay2, i64 99) #4, !dbg !99
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !100
  store i32 0, i32* %arrayidx4, align 4, !dbg !101
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !102
  call void @printWLine(i32* %arraydecay5), !dbg !103
  ret void, !dbg !104
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_06.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_06_bad", scope: !12, file: !12, line: 27, type: !13, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_06.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !16, file: !12, line: 32, type: !19)
!16 = distinct !DILexicalBlock(scope: !17, file: !12, line: 31, column: 9)
!17 = distinct !DILexicalBlock(scope: !18, file: !12, line: 30, column: 5)
!18 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 4800, elements: !23)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !21, line: 74, baseType: !22)
!21 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !{!24}
!24 = !DISubrange(count: 150)
!25 = !DILocation(line: 32, column: 21, scope: !16)
!26 = !DILocalVariable(name: "dest", scope: !16, file: !12, line: 32, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 32, column: 32, scope: !16)
!31 = !DILocation(line: 34, column: 21, scope: !16)
!32 = !DILocation(line: 34, column: 13, scope: !16)
!33 = !DILocation(line: 35, column: 13, scope: !16)
!34 = !DILocation(line: 35, column: 23, scope: !16)
!35 = !DILocation(line: 38, column: 21, scope: !16)
!36 = !DILocation(line: 38, column: 27, scope: !16)
!37 = !DILocation(line: 38, column: 13, scope: !16)
!38 = !DILocation(line: 40, column: 24, scope: !16)
!39 = !DILocation(line: 40, column: 13, scope: !16)
!40 = !DILocation(line: 43, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_wchar_t_strncpy_06_good", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DILocation(line: 94, column: 5, scope: !41)
!43 = !DILocation(line: 95, column: 5, scope: !41)
!44 = !DILocation(line: 96, column: 1, scope: !41)
!45 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !46, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!22, !22, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !12, line: 107, type: !22)
!52 = !DILocation(line: 107, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !12, line: 107, type: !48)
!54 = !DILocation(line: 107, column: 27, scope: !45)
!55 = !DILocation(line: 110, column: 22, scope: !45)
!56 = !DILocation(line: 110, column: 12, scope: !45)
!57 = !DILocation(line: 110, column: 5, scope: !45)
!58 = !DILocation(line: 112, column: 5, scope: !45)
!59 = !DILocation(line: 113, column: 5, scope: !45)
!60 = !DILocation(line: 114, column: 5, scope: !45)
!61 = !DILocation(line: 117, column: 5, scope: !45)
!62 = !DILocation(line: 118, column: 5, scope: !45)
!63 = !DILocation(line: 119, column: 5, scope: !45)
!64 = !DILocation(line: 121, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "good1", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !67, file: !12, line: 60, type: !19)
!67 = distinct !DILexicalBlock(scope: !68, file: !12, line: 59, column: 9)
!68 = distinct !DILexicalBlock(scope: !69, file: !12, line: 58, column: 5)
!69 = distinct !DILexicalBlock(scope: !65, file: !12, line: 52, column: 8)
!70 = !DILocation(line: 60, column: 21, scope: !67)
!71 = !DILocalVariable(name: "dest", scope: !67, file: !12, line: 60, type: !27)
!72 = !DILocation(line: 60, column: 32, scope: !67)
!73 = !DILocation(line: 62, column: 21, scope: !67)
!74 = !DILocation(line: 62, column: 13, scope: !67)
!75 = !DILocation(line: 63, column: 13, scope: !67)
!76 = !DILocation(line: 63, column: 23, scope: !67)
!77 = !DILocation(line: 66, column: 21, scope: !67)
!78 = !DILocation(line: 66, column: 27, scope: !67)
!79 = !DILocation(line: 66, column: 13, scope: !67)
!80 = !DILocation(line: 67, column: 13, scope: !67)
!81 = !DILocation(line: 67, column: 22, scope: !67)
!82 = !DILocation(line: 68, column: 24, scope: !67)
!83 = !DILocation(line: 68, column: 13, scope: !67)
!84 = !DILocation(line: 71, column: 1, scope: !65)
!85 = distinct !DISubprogram(name: "good2", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 79, type: !19)
!87 = distinct !DILexicalBlock(scope: !88, file: !12, line: 78, column: 9)
!88 = distinct !DILexicalBlock(scope: !89, file: !12, line: 77, column: 5)
!89 = distinct !DILexicalBlock(scope: !85, file: !12, line: 76, column: 8)
!90 = !DILocation(line: 79, column: 21, scope: !87)
!91 = !DILocalVariable(name: "dest", scope: !87, file: !12, line: 79, type: !27)
!92 = !DILocation(line: 79, column: 32, scope: !87)
!93 = !DILocation(line: 81, column: 21, scope: !87)
!94 = !DILocation(line: 81, column: 13, scope: !87)
!95 = !DILocation(line: 82, column: 13, scope: !87)
!96 = !DILocation(line: 82, column: 23, scope: !87)
!97 = !DILocation(line: 85, column: 21, scope: !87)
!98 = !DILocation(line: 85, column: 27, scope: !87)
!99 = !DILocation(line: 85, column: 13, scope: !87)
!100 = !DILocation(line: 86, column: 13, scope: !87)
!101 = !DILocation(line: 86, column: 22, scope: !87)
!102 = !DILocation(line: 87, column: 24, scope: !87)
!103 = !DILocation(line: 87, column: 13, scope: !87)
!104 = !DILocation(line: 90, column: 1, scope: !85)
