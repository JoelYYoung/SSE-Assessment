; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_05.c"
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
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %0 = load i32, i32* @staticTrue, align 4, !dbg !33
  %tobool = icmp ne i32 %0, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !36
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !38
  store i8* %add.ptr, i8** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 199, i1 false), !dbg !47
  %arrayidx3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !48
  store i8 0, i8* %arrayidx3, align 1, !dbg !49
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !50
  %1 = load i8*, i8** %data, align 8, !dbg !51
  %call = call i8* @strcpy(i8* %arraydecay4, i8* %1) #5, !dbg !52
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !53
  call void @printLine(i8* %arraydecay5), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_cpy_05_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #5, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #5, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE127_Buffer_Underread__char_declare_cpy_05_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE127_Buffer_Underread__char_declare_cpy_05_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !83
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  %0 = load i32, i32* @staticFalse, align 4, !dbg !86
  %tobool = icmp ne i32 %0, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !92
  store i8* %arraydecay1, i8** %data, align 8, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 199, i1 false), !dbg !98
  %arrayidx3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !99
  store i8 0, i8* %arrayidx3, align 1, !dbg !100
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !101
  %1 = load i8*, i8** %data, align 8, !dbg !102
  %call = call i8* @strcpy(i8* %arraydecay4, i8* %1) #5, !dbg !103
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !104
  call void @printLine(i8* %arraydecay5), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [200 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !112
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  %0 = load i32, i32* @staticTrue, align 4, !dbg !115
  %tobool = icmp ne i32 %0, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !118
  store i8* %arraydecay1, i8** %data, align 8, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [200 x i8]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %arraydecay2 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 199, i1 false), !dbg !125
  %arrayidx3 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 199, !dbg !126
  store i8 0, i8* %arrayidx3, align 1, !dbg !127
  %arraydecay4 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !128
  %1 = load i8*, i8** %data, align 8, !dbg !129
  %call = call i8* @strcpy(i8* %arraydecay4, i8* %1) #5, !dbg !130
  %arraydecay5 = getelementptr inbounds [200 x i8], [200 x i8]* %dest, i64 0, i64 0, !dbg !131
  call void @printLine(i8* %arraydecay5), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 26, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_05_bad", scope: !10, file: !10, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 32, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 33, column: 10, scope: !18)
!30 = !DILocation(line: 34, column: 5, scope: !18)
!31 = !DILocation(line: 35, column: 5, scope: !18)
!32 = !DILocation(line: 35, column: 23, scope: !18)
!33 = !DILocation(line: 36, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !10, line: 36, column: 8)
!35 = !DILocation(line: 36, column: 8, scope: !18)
!36 = !DILocation(line: 39, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !10, line: 37, column: 5)
!38 = !DILocation(line: 39, column: 27, scope: !37)
!39 = !DILocation(line: 39, column: 14, scope: !37)
!40 = !DILocation(line: 40, column: 5, scope: !37)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !10, line: 42, type: !43)
!42 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 200)
!46 = !DILocation(line: 42, column: 14, scope: !42)
!47 = !DILocation(line: 43, column: 9, scope: !42)
!48 = !DILocation(line: 44, column: 9, scope: !42)
!49 = !DILocation(line: 44, column: 23, scope: !42)
!50 = !DILocation(line: 46, column: 16, scope: !42)
!51 = !DILocation(line: 46, column: 22, scope: !42)
!52 = !DILocation(line: 46, column: 9, scope: !42)
!53 = !DILocation(line: 47, column: 19, scope: !42)
!54 = !DILocation(line: 47, column: 9, scope: !42)
!55 = !DILocation(line: 49, column: 1, scope: !18)
!56 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_cpy_05_good", scope: !10, file: !10, line: 104, type: !19, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 106, column: 5, scope: !56)
!58 = !DILocation(line: 107, column: 5, scope: !56)
!59 = !DILocation(line: 108, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 120, type: !61, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!11, !11, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !10, line: 120, type: !11)
!65 = !DILocation(line: 120, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !10, line: 120, type: !63)
!67 = !DILocation(line: 120, column: 27, scope: !60)
!68 = !DILocation(line: 123, column: 22, scope: !60)
!69 = !DILocation(line: 123, column: 12, scope: !60)
!70 = !DILocation(line: 123, column: 5, scope: !60)
!71 = !DILocation(line: 125, column: 5, scope: !60)
!72 = !DILocation(line: 126, column: 5, scope: !60)
!73 = !DILocation(line: 127, column: 5, scope: !60)
!74 = !DILocation(line: 130, column: 5, scope: !60)
!75 = !DILocation(line: 131, column: 5, scope: !60)
!76 = !DILocation(line: 132, column: 5, scope: !60)
!77 = !DILocation(line: 134, column: 5, scope: !60)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 56, type: !19, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "data", scope: !78, file: !10, line: 58, type: !22)
!80 = !DILocation(line: 58, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBuffer", scope: !78, file: !10, line: 59, type: !26)
!82 = !DILocation(line: 59, column: 10, scope: !78)
!83 = !DILocation(line: 60, column: 5, scope: !78)
!84 = !DILocation(line: 61, column: 5, scope: !78)
!85 = !DILocation(line: 61, column: 23, scope: !78)
!86 = !DILocation(line: 62, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !78, file: !10, line: 62, column: 8)
!88 = !DILocation(line: 62, column: 8, scope: !78)
!89 = !DILocation(line: 65, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !10, line: 63, column: 5)
!91 = !DILocation(line: 66, column: 5, scope: !90)
!92 = !DILocation(line: 70, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !10, line: 68, column: 5)
!94 = !DILocation(line: 70, column: 14, scope: !93)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !10, line: 73, type: !43)
!96 = distinct !DILexicalBlock(scope: !78, file: !10, line: 72, column: 5)
!97 = !DILocation(line: 73, column: 14, scope: !96)
!98 = !DILocation(line: 74, column: 9, scope: !96)
!99 = !DILocation(line: 75, column: 9, scope: !96)
!100 = !DILocation(line: 75, column: 23, scope: !96)
!101 = !DILocation(line: 77, column: 16, scope: !96)
!102 = !DILocation(line: 77, column: 22, scope: !96)
!103 = !DILocation(line: 77, column: 9, scope: !96)
!104 = !DILocation(line: 78, column: 19, scope: !96)
!105 = !DILocation(line: 78, column: 9, scope: !96)
!106 = !DILocation(line: 80, column: 1, scope: !78)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 83, type: !19, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!108 = !DILocalVariable(name: "data", scope: !107, file: !10, line: 85, type: !22)
!109 = !DILocation(line: 85, column: 12, scope: !107)
!110 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !10, line: 86, type: !26)
!111 = !DILocation(line: 86, column: 10, scope: !107)
!112 = !DILocation(line: 87, column: 5, scope: !107)
!113 = !DILocation(line: 88, column: 5, scope: !107)
!114 = !DILocation(line: 88, column: 23, scope: !107)
!115 = !DILocation(line: 89, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !107, file: !10, line: 89, column: 8)
!117 = !DILocation(line: 89, column: 8, scope: !107)
!118 = !DILocation(line: 92, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !10, line: 90, column: 5)
!120 = !DILocation(line: 92, column: 14, scope: !119)
!121 = !DILocation(line: 93, column: 5, scope: !119)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !10, line: 95, type: !43)
!123 = distinct !DILexicalBlock(scope: !107, file: !10, line: 94, column: 5)
!124 = !DILocation(line: 95, column: 14, scope: !123)
!125 = !DILocation(line: 96, column: 9, scope: !123)
!126 = !DILocation(line: 97, column: 9, scope: !123)
!127 = !DILocation(line: 97, column: 23, scope: !123)
!128 = !DILocation(line: 99, column: 16, scope: !123)
!129 = !DILocation(line: 99, column: 22, scope: !123)
!130 = !DILocation(line: 99, column: 9, scope: !123)
!131 = !DILocation(line: 100, column: 19, scope: !123)
!132 = !DILocation(line: 100, column: 9, scope: !123)
!133 = !DILocation(line: 102, column: 1, scope: !107)
