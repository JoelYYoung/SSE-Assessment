; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_cpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !30, metadata !DIExpression()), !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !34
  store i8* %call, i8** %dataBuffer, align 8, !dbg !33
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !35
  %cmp = icmp eq i8* %1, null, !dbg !37
  br i1 %cmp, label %if.then1, label %if.end, !dbg !38

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !42
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !43
  store i8 0, i8* %arrayidx, align 1, !dbg !44
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !45
  %add.ptr = getelementptr inbounds i8, i8* %4, i64 -8, !dbg !46
  store i8* %add.ptr, i8** %data, align 8, !dbg !47
  br label %if.end2, !dbg !48

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !49, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !55
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx3, align 1, !dbg !57
  %5 = load i8*, i8** %data, align 8, !dbg !58
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !59
  %call5 = call i8* @strcpy(i8* %5, i8* %arraydecay4) #6, !dbg !60
  %6 = load i8*, i8** %data, align 8, !dbg !61
  call void @printLine(i8* %6), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_char_cpy_05_good() #0 !dbg !64 {
entry:
  call void @goodG2B1(), !dbg !65
  call void @goodG2B2(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* null) #6, !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 %conv) #6, !dbg !78
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE124_Buffer_Underwrite__malloc_char_cpy_05_good(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE124_Buffer_Underwrite__malloc_char_cpy_05_bad(), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i8* null, i8** %data, align 8, !dbg !89
  %0 = load i32, i32* @staticFalse, align 4, !dbg !90
  %tobool = icmp ne i32 %0, 0, !dbg !90
  br i1 %tobool, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end2, !dbg !95

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !99
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !100
  store i8* %call, i8** %dataBuffer, align 8, !dbg !99
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !101
  %cmp = icmp eq i8* %1, null, !dbg !103
  br i1 %cmp, label %if.then1, label %if.end, !dbg !104

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !108
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !111
  store i8* %4, i8** %data, align 8, !dbg !112
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !116
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !117
  store i8 0, i8* %arrayidx3, align 1, !dbg !118
  %5 = load i8*, i8** %data, align 8, !dbg !119
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !120
  %call5 = call i8* @strcpy(i8* %5, i8* %arraydecay4) #6, !dbg !121
  %6 = load i8*, i8** %data, align 8, !dbg !122
  call void @printLine(i8* %6), !dbg !123
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !125 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !126, metadata !DIExpression()), !dbg !127
  store i8* null, i8** %data, align 8, !dbg !128
  %0 = load i32, i32* @staticTrue, align 4, !dbg !129
  %tobool = icmp ne i32 %0, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.end2, !dbg !131

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !132, metadata !DIExpression()), !dbg !135
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !136
  store i8* %call, i8** %dataBuffer, align 8, !dbg !135
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !137
  %cmp = icmp eq i8* %1, null, !dbg !139
  br i1 %cmp, label %if.then1, label %if.end, !dbg !140

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !141
  unreachable, !dbg !141

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !144
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !145
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !145
  store i8 0, i8* %arrayidx, align 1, !dbg !146
  %4 = load i8*, i8** %dataBuffer, align 8, !dbg !147
  store i8* %4, i8** %data, align 8, !dbg !148
  br label %if.end2, !dbg !149

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !150, metadata !DIExpression()), !dbg !152
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !153
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !154
  store i8 0, i8* %arrayidx3, align 1, !dbg !155
  %5 = load i8*, i8** %data, align 8, !dbg !156
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !157
  %call5 = call i8* @strcpy(i8* %5, i8* %arraydecay4) #6, !dbg !158
  %6 = load i8*, i8** %data, align 8, !dbg !159
  call void @printLine(i8* %6), !dbg !160
  ret void, !dbg !161
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 25, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 26, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_char_cpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_cpy_05_bad", scope: !13, file: !13, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 12, scope: !21)
!26 = !DILocation(line: 33, column: 10, scope: !21)
!27 = !DILocation(line: 34, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 8)
!29 = !DILocation(line: 34, column: 8, scope: !21)
!30 = !DILocalVariable(name: "dataBuffer", scope: !31, file: !13, line: 37, type: !6)
!31 = distinct !DILexicalBlock(scope: !32, file: !13, line: 36, column: 9)
!32 = distinct !DILexicalBlock(scope: !28, file: !13, line: 35, column: 5)
!33 = !DILocation(line: 37, column: 20, scope: !31)
!34 = !DILocation(line: 37, column: 41, scope: !31)
!35 = !DILocation(line: 38, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !13, line: 38, column: 17)
!37 = !DILocation(line: 38, column: 28, scope: !36)
!38 = !DILocation(line: 38, column: 17, scope: !31)
!39 = !DILocation(line: 38, column: 38, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !13, line: 38, column: 37)
!41 = !DILocation(line: 39, column: 20, scope: !31)
!42 = !DILocation(line: 39, column: 13, scope: !31)
!43 = !DILocation(line: 40, column: 13, scope: !31)
!44 = !DILocation(line: 40, column: 31, scope: !31)
!45 = !DILocation(line: 42, column: 20, scope: !31)
!46 = !DILocation(line: 42, column: 31, scope: !31)
!47 = !DILocation(line: 42, column: 18, scope: !31)
!48 = !DILocation(line: 44, column: 5, scope: !32)
!49 = !DILocalVariable(name: "source", scope: !50, file: !13, line: 46, type: !51)
!50 = distinct !DILexicalBlock(scope: !21, file: !13, line: 45, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 46, column: 14, scope: !50)
!55 = !DILocation(line: 47, column: 9, scope: !50)
!56 = !DILocation(line: 48, column: 9, scope: !50)
!57 = !DILocation(line: 48, column: 23, scope: !50)
!58 = !DILocation(line: 50, column: 16, scope: !50)
!59 = !DILocation(line: 50, column: 22, scope: !50)
!60 = !DILocation(line: 50, column: 9, scope: !50)
!61 = !DILocation(line: 51, column: 19, scope: !50)
!62 = !DILocation(line: 51, column: 9, scope: !50)
!63 = !DILocation(line: 55, column: 1, scope: !21)
!64 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_char_cpy_05_good", scope: !13, file: !13, line: 122, type: !22, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DILocation(line: 124, column: 5, scope: !64)
!66 = !DILocation(line: 125, column: 5, scope: !64)
!67 = !DILocation(line: 126, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 138, type: !69, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DISubroutineType(types: !70)
!70 = !{!14, !14, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !13, line: 138, type: !14)
!73 = !DILocation(line: 138, column: 14, scope: !68)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !13, line: 138, type: !71)
!75 = !DILocation(line: 138, column: 27, scope: !68)
!76 = !DILocation(line: 141, column: 22, scope: !68)
!77 = !DILocation(line: 141, column: 12, scope: !68)
!78 = !DILocation(line: 141, column: 5, scope: !68)
!79 = !DILocation(line: 143, column: 5, scope: !68)
!80 = !DILocation(line: 144, column: 5, scope: !68)
!81 = !DILocation(line: 145, column: 5, scope: !68)
!82 = !DILocation(line: 148, column: 5, scope: !68)
!83 = !DILocation(line: 149, column: 5, scope: !68)
!84 = !DILocation(line: 150, column: 5, scope: !68)
!85 = !DILocation(line: 152, column: 5, scope: !68)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 62, type: !22, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocalVariable(name: "data", scope: !86, file: !13, line: 64, type: !6)
!88 = !DILocation(line: 64, column: 12, scope: !86)
!89 = !DILocation(line: 65, column: 10, scope: !86)
!90 = !DILocation(line: 66, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !13, line: 66, column: 8)
!92 = !DILocation(line: 66, column: 8, scope: !86)
!93 = !DILocation(line: 69, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !13, line: 67, column: 5)
!95 = !DILocation(line: 70, column: 5, scope: !94)
!96 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !13, line: 74, type: !6)
!97 = distinct !DILexicalBlock(scope: !98, file: !13, line: 73, column: 9)
!98 = distinct !DILexicalBlock(scope: !91, file: !13, line: 72, column: 5)
!99 = !DILocation(line: 74, column: 20, scope: !97)
!100 = !DILocation(line: 74, column: 41, scope: !97)
!101 = !DILocation(line: 75, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !13, line: 75, column: 17)
!103 = !DILocation(line: 75, column: 28, scope: !102)
!104 = !DILocation(line: 75, column: 17, scope: !97)
!105 = !DILocation(line: 75, column: 38, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !13, line: 75, column: 37)
!107 = !DILocation(line: 76, column: 20, scope: !97)
!108 = !DILocation(line: 76, column: 13, scope: !97)
!109 = !DILocation(line: 77, column: 13, scope: !97)
!110 = !DILocation(line: 77, column: 31, scope: !97)
!111 = !DILocation(line: 79, column: 20, scope: !97)
!112 = !DILocation(line: 79, column: 18, scope: !97)
!113 = !DILocalVariable(name: "source", scope: !114, file: !13, line: 83, type: !51)
!114 = distinct !DILexicalBlock(scope: !86, file: !13, line: 82, column: 5)
!115 = !DILocation(line: 83, column: 14, scope: !114)
!116 = !DILocation(line: 84, column: 9, scope: !114)
!117 = !DILocation(line: 85, column: 9, scope: !114)
!118 = !DILocation(line: 85, column: 23, scope: !114)
!119 = !DILocation(line: 87, column: 16, scope: !114)
!120 = !DILocation(line: 87, column: 22, scope: !114)
!121 = !DILocation(line: 87, column: 9, scope: !114)
!122 = !DILocation(line: 88, column: 19, scope: !114)
!123 = !DILocation(line: 88, column: 9, scope: !114)
!124 = !DILocation(line: 92, column: 1, scope: !86)
!125 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 95, type: !22, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!126 = !DILocalVariable(name: "data", scope: !125, file: !13, line: 97, type: !6)
!127 = !DILocation(line: 97, column: 12, scope: !125)
!128 = !DILocation(line: 98, column: 10, scope: !125)
!129 = !DILocation(line: 99, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !13, line: 99, column: 8)
!131 = !DILocation(line: 99, column: 8, scope: !125)
!132 = !DILocalVariable(name: "dataBuffer", scope: !133, file: !13, line: 102, type: !6)
!133 = distinct !DILexicalBlock(scope: !134, file: !13, line: 101, column: 9)
!134 = distinct !DILexicalBlock(scope: !130, file: !13, line: 100, column: 5)
!135 = !DILocation(line: 102, column: 20, scope: !133)
!136 = !DILocation(line: 102, column: 41, scope: !133)
!137 = !DILocation(line: 103, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !133, file: !13, line: 103, column: 17)
!139 = !DILocation(line: 103, column: 28, scope: !138)
!140 = !DILocation(line: 103, column: 17, scope: !133)
!141 = !DILocation(line: 103, column: 38, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !13, line: 103, column: 37)
!143 = !DILocation(line: 104, column: 20, scope: !133)
!144 = !DILocation(line: 104, column: 13, scope: !133)
!145 = !DILocation(line: 105, column: 13, scope: !133)
!146 = !DILocation(line: 105, column: 31, scope: !133)
!147 = !DILocation(line: 107, column: 20, scope: !133)
!148 = !DILocation(line: 107, column: 18, scope: !133)
!149 = !DILocation(line: 109, column: 5, scope: !134)
!150 = !DILocalVariable(name: "source", scope: !151, file: !13, line: 111, type: !51)
!151 = distinct !DILexicalBlock(scope: !125, file: !13, line: 110, column: 5)
!152 = !DILocation(line: 111, column: 14, scope: !151)
!153 = !DILocation(line: 112, column: 9, scope: !151)
!154 = !DILocation(line: 113, column: 9, scope: !151)
!155 = !DILocation(line: 113, column: 23, scope: !151)
!156 = !DILocation(line: 115, column: 16, scope: !151)
!157 = !DILocation(line: 115, column: 22, scope: !151)
!158 = !DILocation(line: 115, column: 9, scope: !151)
!159 = !DILocation(line: 116, column: 19, scope: !151)
!160 = !DILocation(line: 116, column: 9, scope: !151)
!161 = !DILocation(line: 120, column: 1, scope: !125)
