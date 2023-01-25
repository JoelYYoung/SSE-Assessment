; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_memcpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @staticTrue, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !24, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !37
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !40
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !40
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !41
  call void @printLine(i8* %arraydecay3), !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__CWE170_char_memcpy_05_good() #0 !dbg !45 {
entry:
  call void @good1(), !dbg !46
  call void @good2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* null) #6, !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 %conv) #6, !dbg !60
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE126_Buffer_Overread__CWE170_char_memcpy_05_good(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE126_Buffer_Overread__CWE170_char_memcpy_05_bad(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !68 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @staticFalse, align 4, !dbg !69
  %tobool = icmp ne i32 %0, 0, !dbg !69
  br i1 %tobool, label %if.then, label %if.else, !dbg !71

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !72
  br label %if.end, !dbg !74

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !75, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !79, metadata !DIExpression()), !dbg !80
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !81
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !84
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !84
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !84
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !85
  store i8 0, i8* %arrayidx3, align 1, !dbg !86
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !87
  call void @printLine(i8* %arraydecay4), !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !90 {
entry:
  %data = alloca [150 x i8], align 16
  %dest = alloca [100 x i8], align 16
  %0 = load i32, i32* @staticTrue, align 4, !dbg !91
  %tobool = icmp ne i32 %0, 0, !dbg !91
  br i1 %tobool, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [150 x i8]* %data, metadata !94, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 149, i1 false), !dbg !100
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 149, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !103
  %arraydecay2 = getelementptr inbounds [150 x i8], [150 x i8]* %data, i64 0, i64 0, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay1, i8* align 16 %arraydecay2, i64 99, i1 false), !dbg !103
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx3, align 1, !dbg !105
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !106
  call void @printLine(i8* %arraydecay4), !dbg !107
  br label %if.end, !dbg !108

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !109
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 24, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__CWE170_char_memcpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_memcpy_05_bad", scope: !10, file: !10, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocation(line: 30, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !18, file: !10, line: 30, column: 8)
!23 = !DILocation(line: 30, column: 8, scope: !18)
!24 = !DILocalVariable(name: "data", scope: !25, file: !10, line: 33, type: !27)
!25 = distinct !DILexicalBlock(scope: !26, file: !10, line: 32, column: 9)
!26 = distinct !DILexicalBlock(scope: !22, file: !10, line: 31, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 1200, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 150)
!31 = !DILocation(line: 33, column: 18, scope: !25)
!32 = !DILocalVariable(name: "dest", scope: !25, file: !10, line: 33, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 33, column: 29, scope: !25)
!37 = !DILocation(line: 35, column: 13, scope: !25)
!38 = !DILocation(line: 36, column: 13, scope: !25)
!39 = !DILocation(line: 36, column: 23, scope: !25)
!40 = !DILocation(line: 37, column: 13, scope: !25)
!41 = !DILocation(line: 39, column: 23, scope: !25)
!42 = !DILocation(line: 39, column: 13, scope: !25)
!43 = !DILocation(line: 41, column: 5, scope: !26)
!44 = !DILocation(line: 42, column: 1, scope: !18)
!45 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE170_char_memcpy_05_good", scope: !10, file: !10, line: 87, type: !19, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!46 = !DILocation(line: 89, column: 5, scope: !45)
!47 = !DILocation(line: 90, column: 5, scope: !45)
!48 = !DILocation(line: 91, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 102, type: !50, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!50 = !DISubroutineType(types: !51)
!51 = !{!11, !11, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !10, line: 102, type: !11)
!55 = !DILocation(line: 102, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !10, line: 102, type: !52)
!57 = !DILocation(line: 102, column: 27, scope: !49)
!58 = !DILocation(line: 105, column: 22, scope: !49)
!59 = !DILocation(line: 105, column: 12, scope: !49)
!60 = !DILocation(line: 105, column: 5, scope: !49)
!61 = !DILocation(line: 107, column: 5, scope: !49)
!62 = !DILocation(line: 108, column: 5, scope: !49)
!63 = !DILocation(line: 109, column: 5, scope: !49)
!64 = !DILocation(line: 112, column: 5, scope: !49)
!65 = !DILocation(line: 113, column: 5, scope: !49)
!66 = !DILocation(line: 114, column: 5, scope: !49)
!67 = !DILocation(line: 116, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "good1", scope: !10, file: !10, line: 49, type: !19, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocation(line: 51, column: 8, scope: !70)
!70 = distinct !DILexicalBlock(scope: !68, file: !10, line: 51, column: 8)
!71 = !DILocation(line: 51, column: 8, scope: !68)
!72 = !DILocation(line: 54, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !10, line: 52, column: 5)
!74 = !DILocation(line: 55, column: 5, scope: !73)
!75 = !DILocalVariable(name: "data", scope: !76, file: !10, line: 59, type: !27)
!76 = distinct !DILexicalBlock(scope: !77, file: !10, line: 58, column: 9)
!77 = distinct !DILexicalBlock(scope: !70, file: !10, line: 57, column: 5)
!78 = !DILocation(line: 59, column: 18, scope: !76)
!79 = !DILocalVariable(name: "dest", scope: !76, file: !10, line: 59, type: !33)
!80 = !DILocation(line: 59, column: 29, scope: !76)
!81 = !DILocation(line: 61, column: 13, scope: !76)
!82 = !DILocation(line: 62, column: 13, scope: !76)
!83 = !DILocation(line: 62, column: 23, scope: !76)
!84 = !DILocation(line: 63, column: 13, scope: !76)
!85 = !DILocation(line: 64, column: 13, scope: !76)
!86 = !DILocation(line: 64, column: 22, scope: !76)
!87 = !DILocation(line: 65, column: 23, scope: !76)
!88 = !DILocation(line: 65, column: 13, scope: !76)
!89 = !DILocation(line: 68, column: 1, scope: !68)
!90 = distinct !DISubprogram(name: "good2", scope: !10, file: !10, line: 71, type: !19, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocation(line: 73, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !90, file: !10, line: 73, column: 8)
!93 = !DILocation(line: 73, column: 8, scope: !90)
!94 = !DILocalVariable(name: "data", scope: !95, file: !10, line: 76, type: !27)
!95 = distinct !DILexicalBlock(scope: !96, file: !10, line: 75, column: 9)
!96 = distinct !DILexicalBlock(scope: !92, file: !10, line: 74, column: 5)
!97 = !DILocation(line: 76, column: 18, scope: !95)
!98 = !DILocalVariable(name: "dest", scope: !95, file: !10, line: 76, type: !33)
!99 = !DILocation(line: 76, column: 29, scope: !95)
!100 = !DILocation(line: 78, column: 13, scope: !95)
!101 = !DILocation(line: 79, column: 13, scope: !95)
!102 = !DILocation(line: 79, column: 23, scope: !95)
!103 = !DILocation(line: 80, column: 13, scope: !95)
!104 = !DILocation(line: 81, column: 13, scope: !95)
!105 = !DILocation(line: 81, column: 22, scope: !95)
!106 = !DILocation(line: 82, column: 23, scope: !95)
!107 = !DILocation(line: 82, column: 13, scope: !95)
!108 = !DILocation(line: 84, column: 5, scope: !96)
!109 = !DILocation(line: 85, column: 1, scope: !90)
