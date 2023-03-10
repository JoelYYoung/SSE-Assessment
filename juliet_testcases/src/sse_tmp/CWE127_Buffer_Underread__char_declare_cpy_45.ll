; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_45.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_45.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE127_Buffer_Underread__char_declare_cpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE127_Buffer_Underread__char_declare_cpy_45_goodG2BData = internal global i8* null, align 8, !dbg !8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !32
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !33
  store i8* %add.ptr, i8** %data, align 8, !dbg !34
  %0 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %0, i8** @CWE127_Buffer_Underread__char_declare_cpy_45_badData, align 8, !dbg !36
  call void @badSink(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_45_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* null) #5, !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 %conv) #5, !dbg !53
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE127_Buffer_Underread__char_declare_cpy_45_good(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE127_Buffer_Underread__char_declare_cpy_45_bad(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @badSink() #0 !dbg !61 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i8*, i8** @CWE127_Buffer_Underread__char_declare_cpy_45_badData, align 8, !dbg !64
  store i8* %0, i8** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !65, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !71
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !71
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !74
  %1 = load i8*, i8** %data, align 8, !dbg !75
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %1) #5, !dbg !76
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !77
  call void @printLine(i8* %arraydecay2), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !85
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !88
  store i8* %arraydecay1, i8** %data, align 8, !dbg !89
  %0 = load i8*, i8** %data, align 8, !dbg !90
  store i8* %0, i8** @CWE127_Buffer_Underread__char_declare_cpy_45_goodG2BData, align 8, !dbg !91
  call void @goodG2BSink(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = load i8*, i8** @CWE127_Buffer_Underread__char_declare_cpy_45_goodG2BData, align 8, !dbg !97
  store i8* %0, i8** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 199, i1 false), !dbg !101
  %arrayidx = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  %arraydecay1 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !104
  %1 = load i8*, i8** %data, align 8, !dbg !105
  %call = call i8* @strcpy(i8* %arraydecay1, i8* %1) #5, !dbg !106
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !107
  call void @printLine(i8* %arraydecay2), !dbg !108
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__char_declare_cpy_45_badData", scope: !2, file: !10, line: 21, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "CWE127_Buffer_Underread__char_declare_cpy_45_goodG2BData", scope: !2, file: !10, line: 22, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_45.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_45_bad", scope: !10, file: !10, line: 39, type: !20, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !10, line: 41, type: !11)
!23 = !DILocation(line: 41, column: 12, scope: !19)
!24 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !10, line: 42, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 42, column: 10, scope: !19)
!29 = !DILocation(line: 43, column: 5, scope: !19)
!30 = !DILocation(line: 44, column: 5, scope: !19)
!31 = !DILocation(line: 44, column: 23, scope: !19)
!32 = !DILocation(line: 46, column: 12, scope: !19)
!33 = !DILocation(line: 46, column: 23, scope: !19)
!34 = !DILocation(line: 46, column: 10, scope: !19)
!35 = !DILocation(line: 47, column: 60, scope: !19)
!36 = !DILocation(line: 47, column: 58, scope: !19)
!37 = !DILocation(line: 48, column: 5, scope: !19)
!38 = !DILocation(line: 49, column: 1, scope: !19)
!39 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_45_good", scope: !10, file: !10, line: 81, type: !20, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!40 = !DILocation(line: 83, column: 5, scope: !39)
!41 = !DILocation(line: 84, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 95, type: !43, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45, !46}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !10, line: 95, type: !45)
!48 = !DILocation(line: 95, column: 14, scope: !42)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !10, line: 95, type: !46)
!50 = !DILocation(line: 95, column: 27, scope: !42)
!51 = !DILocation(line: 98, column: 22, scope: !42)
!52 = !DILocation(line: 98, column: 12, scope: !42)
!53 = !DILocation(line: 98, column: 5, scope: !42)
!54 = !DILocation(line: 100, column: 5, scope: !42)
!55 = !DILocation(line: 101, column: 5, scope: !42)
!56 = !DILocation(line: 102, column: 5, scope: !42)
!57 = !DILocation(line: 105, column: 5, scope: !42)
!58 = !DILocation(line: 106, column: 5, scope: !42)
!59 = !DILocation(line: 107, column: 5, scope: !42)
!60 = !DILocation(line: 109, column: 5, scope: !42)
!61 = distinct !DISubprogram(name: "badSink", scope: !10, file: !10, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocalVariable(name: "data", scope: !61, file: !10, line: 28, type: !11)
!63 = !DILocation(line: 28, column: 12, scope: !61)
!64 = !DILocation(line: 28, column: 19, scope: !61)
!65 = !DILocalVariable(name: "dest", scope: !66, file: !10, line: 30, type: !67)
!66 = distinct !DILexicalBlock(scope: !61, file: !10, line: 29, column: 5)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 1600, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 200)
!70 = !DILocation(line: 30, column: 14, scope: !66)
!71 = !DILocation(line: 31, column: 9, scope: !66)
!72 = !DILocation(line: 32, column: 9, scope: !66)
!73 = !DILocation(line: 32, column: 23, scope: !66)
!74 = !DILocation(line: 34, column: 16, scope: !66)
!75 = !DILocation(line: 34, column: 22, scope: !66)
!76 = !DILocation(line: 34, column: 9, scope: !66)
!77 = !DILocation(line: 35, column: 19, scope: !66)
!78 = !DILocation(line: 35, column: 9, scope: !66)
!79 = !DILocation(line: 37, column: 1, scope: !61)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !10, file: !10, line: 69, type: !20, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocalVariable(name: "data", scope: !80, file: !10, line: 71, type: !11)
!82 = !DILocation(line: 71, column: 12, scope: !80)
!83 = !DILocalVariable(name: "dataBuffer", scope: !80, file: !10, line: 72, type: !25)
!84 = !DILocation(line: 72, column: 10, scope: !80)
!85 = !DILocation(line: 73, column: 5, scope: !80)
!86 = !DILocation(line: 74, column: 5, scope: !80)
!87 = !DILocation(line: 74, column: 23, scope: !80)
!88 = !DILocation(line: 76, column: 12, scope: !80)
!89 = !DILocation(line: 76, column: 10, scope: !80)
!90 = !DILocation(line: 77, column: 64, scope: !80)
!91 = !DILocation(line: 77, column: 62, scope: !80)
!92 = !DILocation(line: 78, column: 5, scope: !80)
!93 = !DILocation(line: 79, column: 1, scope: !80)
!94 = distinct !DISubprogram(name: "goodG2BSink", scope: !10, file: !10, line: 56, type: !20, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocalVariable(name: "data", scope: !94, file: !10, line: 58, type: !11)
!96 = !DILocation(line: 58, column: 12, scope: !94)
!97 = !DILocation(line: 58, column: 19, scope: !94)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !10, line: 60, type: !67)
!99 = distinct !DILexicalBlock(scope: !94, file: !10, line: 59, column: 5)
!100 = !DILocation(line: 60, column: 14, scope: !99)
!101 = !DILocation(line: 61, column: 9, scope: !99)
!102 = !DILocation(line: 62, column: 9, scope: !99)
!103 = !DILocation(line: 62, column: 23, scope: !99)
!104 = !DILocation(line: 64, column: 16, scope: !99)
!105 = !DILocation(line: 64, column: 22, scope: !99)
!106 = !DILocation(line: 64, column: 9, scope: !99)
!107 = !DILocation(line: 65, column: 19, scope: !99)
!108 = !DILocation(line: 65, column: 9, scope: !99)
!109 = !DILocation(line: 67, column: 1, scope: !94)
