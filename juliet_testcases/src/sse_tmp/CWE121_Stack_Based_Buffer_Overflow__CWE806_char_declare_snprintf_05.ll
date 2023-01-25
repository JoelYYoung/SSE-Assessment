; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !8
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay, i8** %data, align 8, !dbg !31
  %0 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %0, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !37
  %2 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !46
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !48
  %call = call i64 @strlen(i8* %4) #6, !dbg !49
  %5 = load i8*, i8** %data, align 8, !dbg !50
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !51
  %6 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* %6), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_05_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_05_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_05_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !82
  store i8* %arraydecay, i8** %data, align 8, !dbg !83
  %0 = load i32, i32* @staticFalse, align 4, !dbg !84
  %tobool = icmp ne i32 %0, 0, !dbg !84
  br i1 %tobool, label %if.then, label %if.else, !dbg !86

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !87
  br label %if.end, !dbg !89

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !92
  %2 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !97
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !98
  %4 = load i8*, i8** %data, align 8, !dbg !99
  %call = call i64 @strlen(i8* %4) #6, !dbg !100
  %5 = load i8*, i8** %data, align 8, !dbg !101
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !102
  %6 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* %6), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !111
  store i8* %arraydecay, i8** %data, align 8, !dbg !112
  %0 = load i32, i32* @staticTrue, align 4, !dbg !113
  %tobool = icmp ne i32 %0, 0, !dbg !113
  br i1 %tobool, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !118
  %2 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !122, metadata !DIExpression()), !dbg !124
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !124
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !125
  %4 = load i8*, i8** %data, align 8, !dbg !126
  %call = call i64 @strlen(i8* %4) #6, !dbg !127
  %5 = load i8*, i8** %data, align 8, !dbg !128
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay1, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %5) #7, !dbg !129
  %6 = load i8*, i8** %data, align 8, !dbg !130
  call void @printLine(i8* %6), !dbg !131
  ret void, !dbg !132
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !10, line: 31, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0, !8}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !10, line: 32, type: !11, isLocal: true, isDefinition: true)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_05.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_05_bad", scope: !10, file: !10, line: 36, type: !19, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 38, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DILocation(line: 38, column: 12, scope: !18)
!25 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 39, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 39, column: 10, scope: !18)
!30 = !DILocation(line: 40, column: 12, scope: !18)
!31 = !DILocation(line: 40, column: 10, scope: !18)
!32 = !DILocation(line: 41, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !18, file: !10, line: 41, column: 8)
!34 = !DILocation(line: 41, column: 8, scope: !18)
!35 = !DILocation(line: 44, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !10, line: 42, column: 5)
!37 = !DILocation(line: 44, column: 9, scope: !36)
!38 = !DILocation(line: 45, column: 9, scope: !36)
!39 = !DILocation(line: 45, column: 21, scope: !36)
!40 = !DILocation(line: 46, column: 5, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !10, line: 48, type: !43)
!42 = distinct !DILexicalBlock(scope: !18, file: !10, line: 47, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 48, column: 14, scope: !42)
!47 = !DILocation(line: 50, column: 18, scope: !42)
!48 = !DILocation(line: 50, column: 31, scope: !42)
!49 = !DILocation(line: 50, column: 24, scope: !42)
!50 = !DILocation(line: 50, column: 44, scope: !42)
!51 = !DILocation(line: 50, column: 9, scope: !42)
!52 = !DILocation(line: 51, column: 19, scope: !42)
!53 = !DILocation(line: 51, column: 9, scope: !42)
!54 = !DILocation(line: 53, column: 1, scope: !18)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_snprintf_05_good", scope: !10, file: !10, line: 104, type: !19, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 106, column: 5, scope: !55)
!57 = !DILocation(line: 107, column: 5, scope: !55)
!58 = !DILocation(line: 108, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 120, type: !60, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!11, !11, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !10, line: 120, type: !11)
!64 = !DILocation(line: 120, column: 14, scope: !59)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !10, line: 120, type: !62)
!66 = !DILocation(line: 120, column: 27, scope: !59)
!67 = !DILocation(line: 123, column: 22, scope: !59)
!68 = !DILocation(line: 123, column: 12, scope: !59)
!69 = !DILocation(line: 123, column: 5, scope: !59)
!70 = !DILocation(line: 125, column: 5, scope: !59)
!71 = !DILocation(line: 126, column: 5, scope: !59)
!72 = !DILocation(line: 127, column: 5, scope: !59)
!73 = !DILocation(line: 130, column: 5, scope: !59)
!74 = !DILocation(line: 131, column: 5, scope: !59)
!75 = !DILocation(line: 132, column: 5, scope: !59)
!76 = !DILocation(line: 134, column: 5, scope: !59)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 60, type: !19, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !10, line: 62, type: !22)
!79 = !DILocation(line: 62, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !10, line: 63, type: !26)
!81 = !DILocation(line: 63, column: 10, scope: !77)
!82 = !DILocation(line: 64, column: 12, scope: !77)
!83 = !DILocation(line: 64, column: 10, scope: !77)
!84 = !DILocation(line: 65, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !10, line: 65, column: 8)
!86 = !DILocation(line: 65, column: 8, scope: !77)
!87 = !DILocation(line: 68, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !10, line: 66, column: 5)
!89 = !DILocation(line: 69, column: 5, scope: !88)
!90 = !DILocation(line: 73, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !10, line: 71, column: 5)
!92 = !DILocation(line: 73, column: 9, scope: !91)
!93 = !DILocation(line: 74, column: 9, scope: !91)
!94 = !DILocation(line: 74, column: 20, scope: !91)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !10, line: 77, type: !43)
!96 = distinct !DILexicalBlock(scope: !77, file: !10, line: 76, column: 5)
!97 = !DILocation(line: 77, column: 14, scope: !96)
!98 = !DILocation(line: 79, column: 18, scope: !96)
!99 = !DILocation(line: 79, column: 31, scope: !96)
!100 = !DILocation(line: 79, column: 24, scope: !96)
!101 = !DILocation(line: 79, column: 44, scope: !96)
!102 = !DILocation(line: 79, column: 9, scope: !96)
!103 = !DILocation(line: 80, column: 19, scope: !96)
!104 = !DILocation(line: 80, column: 9, scope: !96)
!105 = !DILocation(line: 82, column: 1, scope: !77)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 85, type: !19, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!107 = !DILocalVariable(name: "data", scope: !106, file: !10, line: 87, type: !22)
!108 = !DILocation(line: 87, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataBuffer", scope: !106, file: !10, line: 88, type: !26)
!110 = !DILocation(line: 88, column: 10, scope: !106)
!111 = !DILocation(line: 89, column: 12, scope: !106)
!112 = !DILocation(line: 89, column: 10, scope: !106)
!113 = !DILocation(line: 90, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !106, file: !10, line: 90, column: 8)
!115 = !DILocation(line: 90, column: 8, scope: !106)
!116 = !DILocation(line: 93, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !10, line: 91, column: 5)
!118 = !DILocation(line: 93, column: 9, scope: !117)
!119 = !DILocation(line: 94, column: 9, scope: !117)
!120 = !DILocation(line: 94, column: 20, scope: !117)
!121 = !DILocation(line: 95, column: 5, scope: !117)
!122 = !DILocalVariable(name: "dest", scope: !123, file: !10, line: 97, type: !43)
!123 = distinct !DILexicalBlock(scope: !106, file: !10, line: 96, column: 5)
!124 = !DILocation(line: 97, column: 14, scope: !123)
!125 = !DILocation(line: 99, column: 18, scope: !123)
!126 = !DILocation(line: 99, column: 31, scope: !123)
!127 = !DILocation(line: 99, column: 24, scope: !123)
!128 = !DILocation(line: 99, column: 44, scope: !123)
!129 = !DILocation(line: 99, column: 9, scope: !123)
!130 = !DILocation(line: 100, column: 19, scope: !123)
!131 = !DILocation(line: 100, column: 9, scope: !123)
!132 = !DILocation(line: 102, column: 1, scope: !106)
