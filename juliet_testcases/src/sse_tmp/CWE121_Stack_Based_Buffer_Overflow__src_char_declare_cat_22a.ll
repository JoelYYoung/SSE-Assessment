; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_badGlobal = dso_local global i32 0, align 4, !dbg !0
@CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_goodG2B1Global = dso_local global i32 0, align 4, !dbg !8
@CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_goodG2B2Global = dso_local global i32 0, align 4, !dbg !12
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_badGlobal, align 4, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_badSource(i8* %0), !dbg !36
  store i8* %call, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %call2 = call i8* @strcat(i8* %arraydecay1, i8* %2) #5, !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %3), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_badSource(i8*) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_good() #0 !dbg !50 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #5, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #5, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !77
  store i8* %arraydecay, i8** %data, align 8, !dbg !78
  store i32 0, i32* @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_goodG2B1Global, align 4, !dbg !79
  %0 = load i8*, i8** %data, align 8, !dbg !80
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_goodG2B1Source(i8* %0), !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !83, metadata !DIExpression()), !dbg !85
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !85
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !86
  %2 = load i8*, i8** %data, align 8, !dbg !87
  %call2 = call i8* @strcat(i8* %arraydecay1, i8* %2) #5, !dbg !88
  %3 = load i8*, i8** %data, align 8, !dbg !89
  call void @printLine(i8* %3), !dbg !90
  ret void, !dbg !91
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_goodG2B1Source(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !97
  store i8* %arraydecay, i8** %data, align 8, !dbg !98
  store i32 1, i32* @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_goodG2B2Global, align 4, !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  %call = call i8* @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_goodG2B2Source(i8* %0), !dbg !101
  store i8* %call, i8** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !105
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !106
  %2 = load i8*, i8** %data, align 8, !dbg !107
  %call2 = call i8* @strcat(i8* %arraydecay1, i8* %2) #5, !dbg !108
  %3 = load i8*, i8** %data, align 8, !dbg !109
  call void @printLine(i8* %3), !dbg !110
  ret void, !dbg !111
}

declare dso_local i8* @CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_goodG2B2Source(i8*) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_badGlobal", scope: !2, file: !10, line: 24, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8, !12}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_goodG2B1Global", scope: !2, file: !10, line: 48, type: !11, isLocal: false, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22a.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_goodG2B2Global", scope: !2, file: !10, line: 49, type: !11, isLocal: false, isDefinition: true)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_bad", scope: !10, file: !10, line: 28, type: !21, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !10, line: 30, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !DILocation(line: 30, column: 12, scope: !20)
!27 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !10, line: 31, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 31, column: 10, scope: !20)
!32 = !DILocation(line: 32, column: 12, scope: !20)
!33 = !DILocation(line: 32, column: 10, scope: !20)
!34 = !DILocation(line: 33, column: 75, scope: !20)
!35 = !DILocation(line: 34, column: 82, scope: !20)
!36 = !DILocation(line: 34, column: 12, scope: !20)
!37 = !DILocation(line: 34, column: 10, scope: !20)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !10, line: 36, type: !40)
!39 = distinct !DILexicalBlock(scope: !20, file: !10, line: 35, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 36, column: 14, scope: !39)
!44 = !DILocation(line: 38, column: 16, scope: !39)
!45 = !DILocation(line: 38, column: 22, scope: !39)
!46 = !DILocation(line: 38, column: 9, scope: !39)
!47 = !DILocation(line: 39, column: 19, scope: !39)
!48 = !DILocation(line: 39, column: 9, scope: !39)
!49 = !DILocation(line: 41, column: 1, scope: !20)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_declare_cat_22_good", scope: !10, file: !10, line: 87, type: !21, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DILocation(line: 89, column: 5, scope: !50)
!52 = !DILocation(line: 90, column: 5, scope: !50)
!53 = !DILocation(line: 91, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 103, type: !55, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!11, !11, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !10, line: 103, type: !11)
!59 = !DILocation(line: 103, column: 14, scope: !54)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !10, line: 103, type: !57)
!61 = !DILocation(line: 103, column: 27, scope: !54)
!62 = !DILocation(line: 106, column: 22, scope: !54)
!63 = !DILocation(line: 106, column: 12, scope: !54)
!64 = !DILocation(line: 106, column: 5, scope: !54)
!65 = !DILocation(line: 108, column: 5, scope: !54)
!66 = !DILocation(line: 109, column: 5, scope: !54)
!67 = !DILocation(line: 110, column: 5, scope: !54)
!68 = !DILocation(line: 113, column: 5, scope: !54)
!69 = !DILocation(line: 114, column: 5, scope: !54)
!70 = !DILocation(line: 115, column: 5, scope: !54)
!71 = !DILocation(line: 117, column: 5, scope: !54)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocalVariable(name: "data", scope: !72, file: !10, line: 56, type: !24)
!74 = !DILocation(line: 56, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !10, line: 57, type: !28)
!76 = !DILocation(line: 57, column: 10, scope: !72)
!77 = !DILocation(line: 58, column: 12, scope: !72)
!78 = !DILocation(line: 58, column: 10, scope: !72)
!79 = !DILocation(line: 59, column: 80, scope: !72)
!80 = !DILocation(line: 60, column: 87, scope: !72)
!81 = !DILocation(line: 60, column: 12, scope: !72)
!82 = !DILocation(line: 60, column: 10, scope: !72)
!83 = !DILocalVariable(name: "dest", scope: !84, file: !10, line: 62, type: !40)
!84 = distinct !DILexicalBlock(scope: !72, file: !10, line: 61, column: 5)
!85 = !DILocation(line: 62, column: 14, scope: !84)
!86 = !DILocation(line: 64, column: 16, scope: !84)
!87 = !DILocation(line: 64, column: 22, scope: !84)
!88 = !DILocation(line: 64, column: 9, scope: !84)
!89 = !DILocation(line: 65, column: 19, scope: !84)
!90 = !DILocation(line: 65, column: 9, scope: !84)
!91 = !DILocation(line: 67, column: 1, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 72, type: !21, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocalVariable(name: "data", scope: !92, file: !10, line: 74, type: !24)
!94 = !DILocation(line: 74, column: 12, scope: !92)
!95 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !10, line: 75, type: !28)
!96 = !DILocation(line: 75, column: 10, scope: !92)
!97 = !DILocation(line: 76, column: 12, scope: !92)
!98 = !DILocation(line: 76, column: 10, scope: !92)
!99 = !DILocation(line: 77, column: 80, scope: !92)
!100 = !DILocation(line: 78, column: 87, scope: !92)
!101 = !DILocation(line: 78, column: 12, scope: !92)
!102 = !DILocation(line: 78, column: 10, scope: !92)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !10, line: 80, type: !40)
!104 = distinct !DILexicalBlock(scope: !92, file: !10, line: 79, column: 5)
!105 = !DILocation(line: 80, column: 14, scope: !104)
!106 = !DILocation(line: 82, column: 16, scope: !104)
!107 = !DILocation(line: 82, column: 22, scope: !104)
!108 = !DILocation(line: 82, column: 9, scope: !104)
!109 = !DILocation(line: 83, column: 19, scope: !104)
!110 = !DILocation(line: 83, column: 9, scope: !104)
!111 = !DILocation(line: 85, column: 1, scope: !92)
