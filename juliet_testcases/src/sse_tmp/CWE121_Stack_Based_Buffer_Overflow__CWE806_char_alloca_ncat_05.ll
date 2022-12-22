; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_05.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 100, align 16, !dbg !27
  store i8* %0, i8** %dataBuffer, align 8, !dbg !26
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  store i8* %1, i8** %data, align 8, !dbg !29
  %2 = load i32, i32* @staticTrue, align 4, !dbg !30
  %tobool = icmp ne i32 %2, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !44
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %7 = load i8*, i8** %data, align 8, !dbg !47
  %call = call i64 @strlen(i8* %7) #6, !dbg !48
  %call1 = call i8* @strncat(i8* %arraydecay, i8* %6, i64 %call) #7, !dbg !49
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !50
  store i8 0, i8* %arrayidx2, align 1, !dbg !51
  %8 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* %8), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_05_good() #0 !dbg !55 {
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
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_05_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_05_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
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
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 100, align 16, !dbg !82
  store i8* %0, i8** %dataBuffer, align 8, !dbg !81
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !83
  store i8* %1, i8** %data, align 8, !dbg !84
  %2 = load i32, i32* @staticFalse, align 4, !dbg !85
  %tobool = icmp ne i32 %2, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !98
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !99
  %6 = load i8*, i8** %data, align 8, !dbg !100
  %7 = load i8*, i8** %data, align 8, !dbg !101
  %call = call i64 @strlen(i8* %7) #6, !dbg !102
  %call1 = call i8* @strncat(i8* %arraydecay, i8* %6, i64 %call) #7, !dbg !103
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !104
  store i8 0, i8* %arrayidx2, align 1, !dbg !105
  %8 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* %8), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 100, align 16, !dbg !114
  store i8* %0, i8** %dataBuffer, align 8, !dbg !113
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !115
  store i8* %1, i8** %data, align 8, !dbg !116
  %2 = load i32, i32* @staticTrue, align 4, !dbg !117
  %tobool = icmp ne i32 %2, 0, !dbg !117
  br i1 %tobool, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !122
  %4 = load i8*, i8** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  br label %if.end, !dbg !125

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !128
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !129
  %6 = load i8*, i8** %data, align 8, !dbg !130
  %7 = load i8*, i8** %data, align 8, !dbg !131
  %call = call i64 @strlen(i8* %7) #6, !dbg !132
  %call1 = call i8* @strncat(i8* %arraydecay, i8* %6, i64 %call) #7, !dbg !133
  %arrayidx2 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !134
  store i8 0, i8* %arrayidx2, align 1, !dbg !135
  %8 = load i8*, i8** %data, align 8, !dbg !136
  call void @printLine(i8* %8), !dbg !137
  ret void, !dbg !138
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
!llvm.module.flags = !{!14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !12, line: 25, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !12, line: 26, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_05.c", directory: "/root/SSE-Assessment")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"clang version 13.0.0"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_05_bad", scope: !12, file: !12, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !20)
!25 = !DILocalVariable(name: "dataBuffer", scope: !20, file: !12, line: 33, type: !6)
!26 = !DILocation(line: 33, column: 12, scope: !20)
!27 = !DILocation(line: 33, column: 33, scope: !20)
!28 = !DILocation(line: 34, column: 12, scope: !20)
!29 = !DILocation(line: 34, column: 10, scope: !20)
!30 = !DILocation(line: 35, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !20, file: !12, line: 35, column: 8)
!32 = !DILocation(line: 35, column: 8, scope: !20)
!33 = !DILocation(line: 38, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 36, column: 5)
!35 = !DILocation(line: 38, column: 9, scope: !34)
!36 = !DILocation(line: 39, column: 9, scope: !34)
!37 = !DILocation(line: 39, column: 21, scope: !34)
!38 = !DILocation(line: 40, column: 5, scope: !34)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !12, line: 42, type: !41)
!40 = distinct !DILexicalBlock(scope: !20, file: !12, line: 41, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 42, column: 14, scope: !40)
!45 = !DILocation(line: 44, column: 17, scope: !40)
!46 = !DILocation(line: 44, column: 23, scope: !40)
!47 = !DILocation(line: 44, column: 36, scope: !40)
!48 = !DILocation(line: 44, column: 29, scope: !40)
!49 = !DILocation(line: 44, column: 9, scope: !40)
!50 = !DILocation(line: 45, column: 9, scope: !40)
!51 = !DILocation(line: 45, column: 20, scope: !40)
!52 = !DILocation(line: 46, column: 19, scope: !40)
!53 = !DILocation(line: 46, column: 9, scope: !40)
!54 = !DILocation(line: 48, column: 1, scope: !20)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_05_good", scope: !12, file: !12, line: 101, type: !21, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 103, column: 5, scope: !55)
!57 = !DILocation(line: 104, column: 5, scope: !55)
!58 = !DILocation(line: 105, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !60, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!13, !13, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !12, line: 117, type: !13)
!64 = !DILocation(line: 117, column: 14, scope: !59)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !12, line: 117, type: !62)
!66 = !DILocation(line: 117, column: 27, scope: !59)
!67 = !DILocation(line: 120, column: 22, scope: !59)
!68 = !DILocation(line: 120, column: 12, scope: !59)
!69 = !DILocation(line: 120, column: 5, scope: !59)
!70 = !DILocation(line: 122, column: 5, scope: !59)
!71 = !DILocation(line: 123, column: 5, scope: !59)
!72 = !DILocation(line: 124, column: 5, scope: !59)
!73 = !DILocation(line: 127, column: 5, scope: !59)
!74 = !DILocation(line: 128, column: 5, scope: !59)
!75 = !DILocation(line: 129, column: 5, scope: !59)
!76 = !DILocation(line: 131, column: 5, scope: !59)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !21, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 57, type: !6)
!79 = !DILocation(line: 57, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !12, line: 58, type: !6)
!81 = !DILocation(line: 58, column: 12, scope: !77)
!82 = !DILocation(line: 58, column: 33, scope: !77)
!83 = !DILocation(line: 59, column: 12, scope: !77)
!84 = !DILocation(line: 59, column: 10, scope: !77)
!85 = !DILocation(line: 60, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !77, file: !12, line: 60, column: 8)
!87 = !DILocation(line: 60, column: 8, scope: !77)
!88 = !DILocation(line: 63, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !12, line: 61, column: 5)
!90 = !DILocation(line: 64, column: 5, scope: !89)
!91 = !DILocation(line: 68, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !12, line: 66, column: 5)
!93 = !DILocation(line: 68, column: 9, scope: !92)
!94 = !DILocation(line: 69, column: 9, scope: !92)
!95 = !DILocation(line: 69, column: 20, scope: !92)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !12, line: 72, type: !41)
!97 = distinct !DILexicalBlock(scope: !77, file: !12, line: 71, column: 5)
!98 = !DILocation(line: 72, column: 14, scope: !97)
!99 = !DILocation(line: 74, column: 17, scope: !97)
!100 = !DILocation(line: 74, column: 23, scope: !97)
!101 = !DILocation(line: 74, column: 36, scope: !97)
!102 = !DILocation(line: 74, column: 29, scope: !97)
!103 = !DILocation(line: 74, column: 9, scope: !97)
!104 = !DILocation(line: 75, column: 9, scope: !97)
!105 = !DILocation(line: 75, column: 20, scope: !97)
!106 = !DILocation(line: 76, column: 19, scope: !97)
!107 = !DILocation(line: 76, column: 9, scope: !97)
!108 = !DILocation(line: 78, column: 1, scope: !77)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !21, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DILocalVariable(name: "data", scope: !109, file: !12, line: 83, type: !6)
!111 = !DILocation(line: 83, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataBuffer", scope: !109, file: !12, line: 84, type: !6)
!113 = !DILocation(line: 84, column: 12, scope: !109)
!114 = !DILocation(line: 84, column: 33, scope: !109)
!115 = !DILocation(line: 85, column: 12, scope: !109)
!116 = !DILocation(line: 85, column: 10, scope: !109)
!117 = !DILocation(line: 86, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !109, file: !12, line: 86, column: 8)
!119 = !DILocation(line: 86, column: 8, scope: !109)
!120 = !DILocation(line: 89, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 87, column: 5)
!122 = !DILocation(line: 89, column: 9, scope: !121)
!123 = !DILocation(line: 90, column: 9, scope: !121)
!124 = !DILocation(line: 90, column: 20, scope: !121)
!125 = !DILocation(line: 91, column: 5, scope: !121)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !12, line: 93, type: !41)
!127 = distinct !DILexicalBlock(scope: !109, file: !12, line: 92, column: 5)
!128 = !DILocation(line: 93, column: 14, scope: !127)
!129 = !DILocation(line: 95, column: 17, scope: !127)
!130 = !DILocation(line: 95, column: 23, scope: !127)
!131 = !DILocation(line: 95, column: 36, scope: !127)
!132 = !DILocation(line: 95, column: 29, scope: !127)
!133 = !DILocation(line: 95, column: 9, scope: !127)
!134 = !DILocation(line: 96, column: 9, scope: !127)
!135 = !DILocation(line: 96, column: 20, scope: !127)
!136 = !DILocation(line: 97, column: 19, scope: !127)
!137 = !DILocation(line: 97, column: 9, scope: !127)
!138 = !DILocation(line: 99, column: 1, scope: !109)
