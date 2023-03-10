; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_32.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBuffer, align 8, !dbg !27
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !31
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !37
  %5 = load i32*, i32** %4, align 8, !dbg !38
  store i32* %5, i32** %data1, align 8, !dbg !36
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !39
  %add.ptr = getelementptr inbounds i32, i32* %6, i64 -8, !dbg !40
  store i32* %add.ptr, i32** %data1, align 8, !dbg !41
  %7 = load i32*, i32** %data1, align 8, !dbg !42
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !43
  store i32* %7, i32** %8, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !48
  %10 = load i32*, i32** %9, align 8, !dbg !49
  store i32* %10, i32** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !57
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !58
  store i32 0, i32* %arrayidx4, align 4, !dbg !59
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !60
  %11 = load i32*, i32** %data2, align 8, !dbg !61
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %11) #4, !dbg !62
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !63
  call void @printWLine(i32* %arraydecay7), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_32_good() #0 !dbg !66 {
entry:
  call void @goodG2B(), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !69 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* null) #4, !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 %conv) #4, !dbg !81
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_32_good(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE127_Buffer_Underread__wchar_t_alloca_cpy_32_bad(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [200 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !92, metadata !DIExpression()), !dbg !93
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !94, metadata !DIExpression()), !dbg !95
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = alloca i8, i64 400, align 16, !dbg !98
  %1 = bitcast i8* %0 to i32*, !dbg !99
  store i32* %1, i32** %dataBuffer, align 8, !dbg !97
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !100
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #4, !dbg !101
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !104, metadata !DIExpression()), !dbg !106
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !107
  %5 = load i32*, i32** %4, align 8, !dbg !108
  store i32* %5, i32** %data1, align 8, !dbg !106
  %6 = load i32*, i32** %dataBuffer, align 8, !dbg !109
  store i32* %6, i32** %data1, align 8, !dbg !110
  %7 = load i32*, i32** %data1, align 8, !dbg !111
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !112
  store i32* %7, i32** %8, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !114, metadata !DIExpression()), !dbg !116
  %9 = load i32**, i32*** %dataPtr2, align 8, !dbg !117
  %10 = load i32*, i32** %9, align 8, !dbg !118
  store i32* %10, i32** %data2, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [200 x i32]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 199) #4, !dbg !123
  %arrayidx4 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 199, !dbg !124
  store i32 0, i32* %arrayidx4, align 4, !dbg !125
  %arraydecay5 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !126
  %11 = load i32*, i32** %data2, align 8, !dbg !127
  %call6 = call i32* @wcscpy(i32* %arraydecay5, i32* %11) #4, !dbg !128
  %arraydecay7 = getelementptr inbounds [200 x i32], [200 x i32]* %dest, i64 0, i64 0, !dbg !129
  call void @printWLine(i32* %arraydecay7), !dbg !130
  ret void, !dbg !131
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_cpy_32_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_alloca_cpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataPtr1", scope: !15, file: !16, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !15)
!24 = !DILocalVariable(name: "dataPtr2", scope: !15, file: !16, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !15)
!26 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 28, type: !4)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 39, scope: !15)
!29 = !DILocation(line: 28, column: 28, scope: !15)
!30 = !DILocation(line: 29, column: 13, scope: !15)
!31 = !DILocation(line: 29, column: 5, scope: !15)
!32 = !DILocation(line: 30, column: 5, scope: !15)
!33 = !DILocation(line: 30, column: 23, scope: !15)
!34 = !DILocalVariable(name: "data", scope: !35, file: !16, line: 32, type: !4)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 31, column: 5)
!36 = !DILocation(line: 32, column: 19, scope: !35)
!37 = !DILocation(line: 32, column: 27, scope: !35)
!38 = !DILocation(line: 32, column: 26, scope: !35)
!39 = !DILocation(line: 34, column: 16, scope: !35)
!40 = !DILocation(line: 34, column: 27, scope: !35)
!41 = !DILocation(line: 34, column: 14, scope: !35)
!42 = !DILocation(line: 35, column: 21, scope: !35)
!43 = !DILocation(line: 35, column: 10, scope: !35)
!44 = !DILocation(line: 35, column: 19, scope: !35)
!45 = !DILocalVariable(name: "data", scope: !46, file: !16, line: 38, type: !4)
!46 = distinct !DILexicalBlock(scope: !15, file: !16, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 19, scope: !46)
!48 = !DILocation(line: 38, column: 27, scope: !46)
!49 = !DILocation(line: 38, column: 26, scope: !46)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !16, line: 40, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !16, line: 39, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 200)
!55 = !DILocation(line: 40, column: 21, scope: !51)
!56 = !DILocation(line: 41, column: 21, scope: !51)
!57 = !DILocation(line: 41, column: 13, scope: !51)
!58 = !DILocation(line: 42, column: 13, scope: !51)
!59 = !DILocation(line: 42, column: 27, scope: !51)
!60 = !DILocation(line: 44, column: 20, scope: !51)
!61 = !DILocation(line: 44, column: 26, scope: !51)
!62 = !DILocation(line: 44, column: 13, scope: !51)
!63 = !DILocation(line: 45, column: 24, scope: !51)
!64 = !DILocation(line: 45, column: 13, scope: !51)
!65 = !DILocation(line: 48, column: 1, scope: !15)
!66 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_alloca_cpy_32_good", scope: !16, file: !16, line: 82, type: !17, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DILocation(line: 84, column: 5, scope: !66)
!68 = !DILocation(line: 85, column: 1, scope: !66)
!69 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 96, type: !70, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{!7, !7, !72}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !69, file: !16, line: 96, type: !7)
!76 = !DILocation(line: 96, column: 14, scope: !69)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !69, file: !16, line: 96, type: !72)
!78 = !DILocation(line: 96, column: 27, scope: !69)
!79 = !DILocation(line: 99, column: 22, scope: !69)
!80 = !DILocation(line: 99, column: 12, scope: !69)
!81 = !DILocation(line: 99, column: 5, scope: !69)
!82 = !DILocation(line: 101, column: 5, scope: !69)
!83 = !DILocation(line: 102, column: 5, scope: !69)
!84 = !DILocation(line: 103, column: 5, scope: !69)
!85 = !DILocation(line: 106, column: 5, scope: !69)
!86 = !DILocation(line: 107, column: 5, scope: !69)
!87 = !DILocation(line: 108, column: 5, scope: !69)
!88 = !DILocation(line: 110, column: 5, scope: !69)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 55, type: !17, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(name: "data", scope: !89, file: !16, line: 57, type: !4)
!91 = !DILocation(line: 57, column: 15, scope: !89)
!92 = !DILocalVariable(name: "dataPtr1", scope: !89, file: !16, line: 58, type: !22)
!93 = !DILocation(line: 58, column: 16, scope: !89)
!94 = !DILocalVariable(name: "dataPtr2", scope: !89, file: !16, line: 59, type: !22)
!95 = !DILocation(line: 59, column: 16, scope: !89)
!96 = !DILocalVariable(name: "dataBuffer", scope: !89, file: !16, line: 60, type: !4)
!97 = !DILocation(line: 60, column: 15, scope: !89)
!98 = !DILocation(line: 60, column: 39, scope: !89)
!99 = !DILocation(line: 60, column: 28, scope: !89)
!100 = !DILocation(line: 61, column: 13, scope: !89)
!101 = !DILocation(line: 61, column: 5, scope: !89)
!102 = !DILocation(line: 62, column: 5, scope: !89)
!103 = !DILocation(line: 62, column: 23, scope: !89)
!104 = !DILocalVariable(name: "data", scope: !105, file: !16, line: 64, type: !4)
!105 = distinct !DILexicalBlock(scope: !89, file: !16, line: 63, column: 5)
!106 = !DILocation(line: 64, column: 19, scope: !105)
!107 = !DILocation(line: 64, column: 27, scope: !105)
!108 = !DILocation(line: 64, column: 26, scope: !105)
!109 = !DILocation(line: 66, column: 16, scope: !105)
!110 = !DILocation(line: 66, column: 14, scope: !105)
!111 = !DILocation(line: 67, column: 21, scope: !105)
!112 = !DILocation(line: 67, column: 10, scope: !105)
!113 = !DILocation(line: 67, column: 19, scope: !105)
!114 = !DILocalVariable(name: "data", scope: !115, file: !16, line: 70, type: !4)
!115 = distinct !DILexicalBlock(scope: !89, file: !16, line: 69, column: 5)
!116 = !DILocation(line: 70, column: 19, scope: !115)
!117 = !DILocation(line: 70, column: 27, scope: !115)
!118 = !DILocation(line: 70, column: 26, scope: !115)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !16, line: 72, type: !52)
!120 = distinct !DILexicalBlock(scope: !115, file: !16, line: 71, column: 9)
!121 = !DILocation(line: 72, column: 21, scope: !120)
!122 = !DILocation(line: 73, column: 21, scope: !120)
!123 = !DILocation(line: 73, column: 13, scope: !120)
!124 = !DILocation(line: 74, column: 13, scope: !120)
!125 = !DILocation(line: 74, column: 27, scope: !120)
!126 = !DILocation(line: 76, column: 20, scope: !120)
!127 = !DILocation(line: 76, column: 26, scope: !120)
!128 = !DILocation(line: 76, column: 13, scope: !120)
!129 = !DILocation(line: 77, column: 24, scope: !120)
!130 = !DILocation(line: 77, column: 13, scope: !120)
!131 = !DILocation(line: 80, column: 1, scope: !89)
