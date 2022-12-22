; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_02.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_02_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !39
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %4 = load i32*, i32** %data, align 8, !dbg !42
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !43
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %3, i64 %call2) #6, !dbg !44
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !45
  store i32 0, i32* %arrayidx4, align 4, !dbg !46
  %5 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %5), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_02_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #6, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #6, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_02_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_02_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !79
  store i32* %arraydecay, i32** %data, align 8, !dbg !80
  %0 = load i32*, i32** %data, align 8, !dbg !81
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !84
  %1 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !87, metadata !DIExpression()), !dbg !89
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !89
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !90
  %3 = load i32*, i32** %data, align 8, !dbg !91
  %4 = load i32*, i32** %data, align 8, !dbg !92
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !93
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %3, i64 %call2) #6, !dbg !94
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !95
  store i32 0, i32* %arrayidx4, align 4, !dbg !96
  %5 = load i32*, i32** %data, align 8, !dbg !97
  call void @printWLine(i32* %5), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !105
  store i32* %arraydecay, i32** %data, align 8, !dbg !106
  %0 = load i32*, i32** %data, align 8, !dbg !107
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !110
  %1 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !115
  %arraydecay1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !116
  %3 = load i32*, i32** %data, align 8, !dbg !117
  %4 = load i32*, i32** %data, align 8, !dbg !118
  %call2 = call i64 @wcslen(i32* %4) #7, !dbg !119
  %call3 = call i32* @wcsncpy(i32* %arraydecay1, i32* %3, i64 %call2) #6, !dbg !120
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !121
  store i32 0, i32* %arrayidx4, align 4, !dbg !122
  %5 = load i32*, i32** %data, align 8, !dbg !123
  call void @printWLine(i32* %5), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_02.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_02_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_02.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 12, scope: !11)
!27 = !DILocation(line: 27, column: 10, scope: !11)
!28 = !DILocation(line: 31, column: 17, scope: !29)
!29 = distinct !DILexicalBlock(scope: !30, file: !12, line: 29, column: 5)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!31 = !DILocation(line: 31, column: 9, scope: !29)
!32 = !DILocation(line: 32, column: 9, scope: !29)
!33 = !DILocation(line: 32, column: 21, scope: !29)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !12, line: 35, type: !36)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 35, column: 17, scope: !35)
!40 = !DILocation(line: 37, column: 17, scope: !35)
!41 = !DILocation(line: 37, column: 23, scope: !35)
!42 = !DILocation(line: 37, column: 36, scope: !35)
!43 = !DILocation(line: 37, column: 29, scope: !35)
!44 = !DILocation(line: 37, column: 9, scope: !35)
!45 = !DILocation(line: 38, column: 9, scope: !35)
!46 = !DILocation(line: 38, column: 20, scope: !35)
!47 = !DILocation(line: 39, column: 20, scope: !35)
!48 = !DILocation(line: 39, column: 9, scope: !35)
!49 = !DILocation(line: 41, column: 1, scope: !11)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_ncpy_02_good", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 96, column: 5, scope: !50)
!52 = !DILocation(line: 97, column: 5, scope: !50)
!53 = !DILocation(line: 98, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 110, type: !55, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!19, !19, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !12, line: 110, type: !19)
!61 = !DILocation(line: 110, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !12, line: 110, type: !57)
!63 = !DILocation(line: 110, column: 27, scope: !54)
!64 = !DILocation(line: 113, column: 22, scope: !54)
!65 = !DILocation(line: 113, column: 12, scope: !54)
!66 = !DILocation(line: 113, column: 5, scope: !54)
!67 = !DILocation(line: 115, column: 5, scope: !54)
!68 = !DILocation(line: 116, column: 5, scope: !54)
!69 = !DILocation(line: 117, column: 5, scope: !54)
!70 = !DILocation(line: 120, column: 5, scope: !54)
!71 = !DILocation(line: 121, column: 5, scope: !54)
!72 = !DILocation(line: 122, column: 5, scope: !54)
!73 = !DILocation(line: 124, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 48, type: !13, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 50, type: !16)
!76 = !DILocation(line: 50, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !12, line: 51, type: !22)
!78 = !DILocation(line: 51, column: 13, scope: !74)
!79 = !DILocation(line: 52, column: 12, scope: !74)
!80 = !DILocation(line: 52, column: 10, scope: !74)
!81 = !DILocation(line: 61, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !83, file: !12, line: 59, column: 5)
!83 = distinct !DILexicalBlock(scope: !74, file: !12, line: 53, column: 8)
!84 = !DILocation(line: 61, column: 9, scope: !82)
!85 = !DILocation(line: 62, column: 9, scope: !82)
!86 = !DILocation(line: 62, column: 20, scope: !82)
!87 = !DILocalVariable(name: "dest", scope: !88, file: !12, line: 65, type: !36)
!88 = distinct !DILexicalBlock(scope: !74, file: !12, line: 64, column: 5)
!89 = !DILocation(line: 65, column: 17, scope: !88)
!90 = !DILocation(line: 67, column: 17, scope: !88)
!91 = !DILocation(line: 67, column: 23, scope: !88)
!92 = !DILocation(line: 67, column: 36, scope: !88)
!93 = !DILocation(line: 67, column: 29, scope: !88)
!94 = !DILocation(line: 67, column: 9, scope: !88)
!95 = !DILocation(line: 68, column: 9, scope: !88)
!96 = !DILocation(line: 68, column: 20, scope: !88)
!97 = !DILocation(line: 69, column: 20, scope: !88)
!98 = !DILocation(line: 69, column: 9, scope: !88)
!99 = !DILocation(line: 71, column: 1, scope: !74)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 76, type: !16)
!102 = !DILocation(line: 76, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !12, line: 77, type: !22)
!104 = !DILocation(line: 77, column: 13, scope: !100)
!105 = !DILocation(line: 78, column: 12, scope: !100)
!106 = !DILocation(line: 78, column: 10, scope: !100)
!107 = !DILocation(line: 82, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !109, file: !12, line: 80, column: 5)
!109 = distinct !DILexicalBlock(scope: !100, file: !12, line: 79, column: 8)
!110 = !DILocation(line: 82, column: 9, scope: !108)
!111 = !DILocation(line: 83, column: 9, scope: !108)
!112 = !DILocation(line: 83, column: 20, scope: !108)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !12, line: 86, type: !36)
!114 = distinct !DILexicalBlock(scope: !100, file: !12, line: 85, column: 5)
!115 = !DILocation(line: 86, column: 17, scope: !114)
!116 = !DILocation(line: 88, column: 17, scope: !114)
!117 = !DILocation(line: 88, column: 23, scope: !114)
!118 = !DILocation(line: 88, column: 36, scope: !114)
!119 = !DILocation(line: 88, column: 29, scope: !114)
!120 = !DILocation(line: 88, column: 9, scope: !114)
!121 = !DILocation(line: 89, column: 9, scope: !114)
!122 = !DILocation(line: 89, column: 20, scope: !114)
!123 = !DILocation(line: 90, column: 20, scope: !114)
!124 = !DILocation(line: 90, column: 9, scope: !114)
!125 = !DILocation(line: 92, column: 1, scope: !100)
