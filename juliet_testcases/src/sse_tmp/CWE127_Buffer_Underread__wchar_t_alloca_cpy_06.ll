; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_06.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_06_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !26
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !27
  store i32 0, i32* %arrayidx, align 4, !dbg !28
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !32
  store i32* %add.ptr, i32** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !40
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !41
  %arrayidx2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !42
  store i32 0, i32* %arrayidx2, align 4, !dbg !43
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %call4 = call i32* @wcscpy(i32* %arraydecay3, i32* %5) #4, !dbg !46
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !47
  call void @printWLine(i32* %arraydecay5), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_06_good() #0 !dbg !50 {
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
  %call = call i64 @time(i64* null) #4, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #4, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_06_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_06_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 400, align 16, !dbg !79
  %1 = bitcast i8* %0 to i32*, !dbg !80
  store i32* %1, i32** %dataBuffer, align 8, !dbg !78
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !81
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !82
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !83
  store i32 0, i32* %arrayidx, align 4, !dbg !84
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !85
  store i32* %4, i32** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !89, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !92
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !93
  %arrayidx2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !94
  store i32 0, i32* %arrayidx2, align 4, !dbg !95
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !96
  %5 = load i32*, i32** %data, align 8, !dbg !97
  %call4 = call i32* @wcscpy(i32* %arraydecay3, i32* %5) #4, !dbg !98
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !99
  call void @printWLine(i32* %arraydecay5), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 400, align 16, !dbg !107
  %1 = bitcast i8* %0 to i32*, !dbg !108
  store i32* %1, i32** %dataBuffer, align 8, !dbg !106
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !110
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !113
  store i32* %4, i32** %data, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !120
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !121
  %arrayidx2 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !122
  store i32 0, i32* %arrayidx2, align 4, !dbg !123
  %arraydecay3 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !124
  %5 = load i32*, i32** %data, align 8, !dbg !125
  %call4 = call i32* @wcscpy(i32* %arraydecay3, i32* %5) #4, !dbg !126
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !127
  call void @printWLine(i32* %arraydecay5), !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_06.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_cpy_06_bad", scope: !16, file: !16, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_06.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 29, type: !4)
!20 = !DILocation(line: 29, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 30, type: !4)
!22 = !DILocation(line: 30, column: 15, scope: !15)
!23 = !DILocation(line: 30, column: 39, scope: !15)
!24 = !DILocation(line: 30, column: 28, scope: !15)
!25 = !DILocation(line: 31, column: 13, scope: !15)
!26 = !DILocation(line: 31, column: 5, scope: !15)
!27 = !DILocation(line: 32, column: 5, scope: !15)
!28 = !DILocation(line: 32, column: 23, scope: !15)
!29 = !DILocation(line: 36, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !16, line: 34, column: 5)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 8)
!32 = !DILocation(line: 36, column: 27, scope: !30)
!33 = !DILocation(line: 36, column: 14, scope: !30)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !16, line: 39, type: !36)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 38, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 200)
!39 = !DILocation(line: 39, column: 17, scope: !35)
!40 = !DILocation(line: 40, column: 17, scope: !35)
!41 = !DILocation(line: 40, column: 9, scope: !35)
!42 = !DILocation(line: 41, column: 9, scope: !35)
!43 = !DILocation(line: 41, column: 23, scope: !35)
!44 = !DILocation(line: 43, column: 16, scope: !35)
!45 = !DILocation(line: 43, column: 22, scope: !35)
!46 = !DILocation(line: 43, column: 9, scope: !35)
!47 = !DILocation(line: 44, column: 20, scope: !35)
!48 = !DILocation(line: 44, column: 9, scope: !35)
!49 = !DILocation(line: 46, column: 1, scope: !15)
!50 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_cpy_06_good", scope: !16, file: !16, line: 101, type: !17, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 103, column: 5, scope: !50)
!52 = !DILocation(line: 104, column: 5, scope: !50)
!53 = !DILocation(line: 105, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 117, type: !55, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DISubroutineType(types: !56)
!56 = !{!7, !7, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !16, line: 117, type: !7)
!61 = !DILocation(line: 117, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !16, line: 117, type: !57)
!63 = !DILocation(line: 117, column: 27, scope: !54)
!64 = !DILocation(line: 120, column: 22, scope: !54)
!65 = !DILocation(line: 120, column: 12, scope: !54)
!66 = !DILocation(line: 120, column: 5, scope: !54)
!67 = !DILocation(line: 122, column: 5, scope: !54)
!68 = !DILocation(line: 123, column: 5, scope: !54)
!69 = !DILocation(line: 124, column: 5, scope: !54)
!70 = !DILocation(line: 127, column: 5, scope: !54)
!71 = !DILocation(line: 128, column: 5, scope: !54)
!72 = !DILocation(line: 129, column: 5, scope: !54)
!73 = !DILocation(line: 131, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 53, type: !17, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !16, line: 55, type: !4)
!76 = !DILocation(line: 55, column: 15, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !16, line: 56, type: !4)
!78 = !DILocation(line: 56, column: 15, scope: !74)
!79 = !DILocation(line: 56, column: 39, scope: !74)
!80 = !DILocation(line: 56, column: 28, scope: !74)
!81 = !DILocation(line: 57, column: 13, scope: !74)
!82 = !DILocation(line: 57, column: 5, scope: !74)
!83 = !DILocation(line: 58, column: 5, scope: !74)
!84 = !DILocation(line: 58, column: 23, scope: !74)
!85 = !DILocation(line: 67, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !87, file: !16, line: 65, column: 5)
!87 = distinct !DILexicalBlock(scope: !74, file: !16, line: 59, column: 8)
!88 = !DILocation(line: 67, column: 14, scope: !86)
!89 = !DILocalVariable(name: "dest", scope: !90, file: !16, line: 70, type: !36)
!90 = distinct !DILexicalBlock(scope: !74, file: !16, line: 69, column: 5)
!91 = !DILocation(line: 70, column: 17, scope: !90)
!92 = !DILocation(line: 71, column: 17, scope: !90)
!93 = !DILocation(line: 71, column: 9, scope: !90)
!94 = !DILocation(line: 72, column: 9, scope: !90)
!95 = !DILocation(line: 72, column: 23, scope: !90)
!96 = !DILocation(line: 74, column: 16, scope: !90)
!97 = !DILocation(line: 74, column: 22, scope: !90)
!98 = !DILocation(line: 74, column: 9, scope: !90)
!99 = !DILocation(line: 75, column: 20, scope: !90)
!100 = !DILocation(line: 75, column: 9, scope: !90)
!101 = !DILocation(line: 77, column: 1, scope: !74)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 80, type: !17, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocalVariable(name: "data", scope: !102, file: !16, line: 82, type: !4)
!104 = !DILocation(line: 82, column: 15, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !16, line: 83, type: !4)
!106 = !DILocation(line: 83, column: 15, scope: !102)
!107 = !DILocation(line: 83, column: 39, scope: !102)
!108 = !DILocation(line: 83, column: 28, scope: !102)
!109 = !DILocation(line: 84, column: 13, scope: !102)
!110 = !DILocation(line: 84, column: 5, scope: !102)
!111 = !DILocation(line: 85, column: 5, scope: !102)
!112 = !DILocation(line: 85, column: 23, scope: !102)
!113 = !DILocation(line: 89, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !115, file: !16, line: 87, column: 5)
!115 = distinct !DILexicalBlock(scope: !102, file: !16, line: 86, column: 8)
!116 = !DILocation(line: 89, column: 14, scope: !114)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !16, line: 92, type: !36)
!118 = distinct !DILexicalBlock(scope: !102, file: !16, line: 91, column: 5)
!119 = !DILocation(line: 92, column: 17, scope: !118)
!120 = !DILocation(line: 93, column: 17, scope: !118)
!121 = !DILocation(line: 93, column: 9, scope: !118)
!122 = !DILocation(line: 94, column: 9, scope: !118)
!123 = !DILocation(line: 94, column: 23, scope: !118)
!124 = !DILocation(line: 96, column: 16, scope: !118)
!125 = !DILocation(line: 96, column: 22, scope: !118)
!126 = !DILocation(line: 96, column: 9, scope: !118)
!127 = !DILocation(line: 97, column: 20, scope: !118)
!128 = !DILocation(line: 97, column: 9, scope: !118)
!129 = !DILocation(line: 99, column: 1, scope: !102)
