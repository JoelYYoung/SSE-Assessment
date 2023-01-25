; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_05.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %cmp = icmp eq i8* %1, null, !dbg !35
  br i1 %cmp, label %if.then1, label %if.end, !dbg !36

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  br label %if.end2, !dbg !41

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx3, align 1, !dbg !50
  %3 = load i8*, i8** %data, align 8, !dbg !51
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !52
  %call5 = call i8* @strncpy(i8* %3, i8* %arraydecay4, i64 99) #6, !dbg !53
  %4 = load i8*, i8** %data, align 8, !dbg !54
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !54
  store i8 0, i8* %arrayidx6, align 1, !dbg !55
  %5 = load i8*, i8** %data, align 8, !dbg !56
  call void @printLine(i8* %5), !dbg !57
  %6 = load i8*, i8** %data, align 8, !dbg !58
  call void @free(i8* %6) #6, !dbg !59
  ret void, !dbg !60
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
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_05_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #6, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #6, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_05_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_05_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i8* null, i8** %data, align 8, !dbg !86
  %0 = load i32, i32* @staticFalse, align 4, !dbg !87
  %tobool = icmp ne i32 %0, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end2, !dbg !92

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !93
  store i8* %call, i8** %data, align 8, !dbg !95
  %1 = load i8*, i8** %data, align 8, !dbg !96
  %cmp = icmp eq i8* %1, null, !dbg !98
  br i1 %cmp, label %if.then1, label %if.end, !dbg !99

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !107
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !108
  store i8 0, i8* %arrayidx3, align 1, !dbg !109
  %3 = load i8*, i8** %data, align 8, !dbg !110
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !111
  %call5 = call i8* @strncpy(i8* %3, i8* %arraydecay4, i64 99) #6, !dbg !112
  %4 = load i8*, i8** %data, align 8, !dbg !113
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !113
  store i8 0, i8* %arrayidx6, align 1, !dbg !114
  %5 = load i8*, i8** %data, align 8, !dbg !115
  call void @printLine(i8* %5), !dbg !116
  %6 = load i8*, i8** %data, align 8, !dbg !117
  call void @free(i8* %6) #6, !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !121, metadata !DIExpression()), !dbg !122
  store i8* null, i8** %data, align 8, !dbg !123
  %0 = load i32, i32* @staticTrue, align 4, !dbg !124
  %tobool = icmp ne i32 %0, 0, !dbg !124
  br i1 %tobool, label %if.then, label %if.end2, !dbg !126

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !127
  store i8* %call, i8** %data, align 8, !dbg !129
  %1 = load i8*, i8** %data, align 8, !dbg !130
  %cmp = icmp eq i8* %1, null, !dbg !132
  br i1 %cmp, label %if.then1, label %if.end, !dbg !133

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !136
  store i8 0, i8* %arrayidx, align 1, !dbg !137
  br label %if.end2, !dbg !138

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !139, metadata !DIExpression()), !dbg !141
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !142
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !143
  store i8 0, i8* %arrayidx3, align 1, !dbg !144
  %3 = load i8*, i8** %data, align 8, !dbg !145
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !146
  %call5 = call i8* @strncpy(i8* %3, i8* %arraydecay4, i64 99) #6, !dbg !147
  %4 = load i8*, i8** %data, align 8, !dbg !148
  %arrayidx6 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !148
  store i8 0, i8* %arrayidx6, align 1, !dbg !149
  %5 = load i8*, i8** %data, align 8, !dbg !150
  call void @printLine(i8* %5), !dbg !151
  %6 = load i8*, i8** %data, align 8, !dbg !152
  call void @free(i8* %6) #6, !dbg !153
  ret void, !dbg !154
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 26, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_05_bad", scope: !13, file: !13, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 12, scope: !21)
!26 = !DILocation(line: 33, column: 10, scope: !21)
!27 = !DILocation(line: 34, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 8)
!29 = !DILocation(line: 34, column: 8, scope: !21)
!30 = !DILocation(line: 37, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !13, line: 35, column: 5)
!32 = !DILocation(line: 37, column: 14, scope: !31)
!33 = !DILocation(line: 38, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !13, line: 38, column: 13)
!35 = !DILocation(line: 38, column: 18, scope: !34)
!36 = !DILocation(line: 38, column: 13, scope: !31)
!37 = !DILocation(line: 38, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !13, line: 38, column: 27)
!39 = !DILocation(line: 39, column: 9, scope: !31)
!40 = !DILocation(line: 39, column: 17, scope: !31)
!41 = !DILocation(line: 40, column: 5, scope: !31)
!42 = !DILocalVariable(name: "source", scope: !43, file: !13, line: 42, type: !44)
!43 = distinct !DILexicalBlock(scope: !21, file: !13, line: 41, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 800, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 42, column: 14, scope: !43)
!48 = !DILocation(line: 43, column: 9, scope: !43)
!49 = !DILocation(line: 44, column: 9, scope: !43)
!50 = !DILocation(line: 44, column: 23, scope: !43)
!51 = !DILocation(line: 46, column: 17, scope: !43)
!52 = !DILocation(line: 46, column: 23, scope: !43)
!53 = !DILocation(line: 46, column: 9, scope: !43)
!54 = !DILocation(line: 47, column: 9, scope: !43)
!55 = !DILocation(line: 47, column: 21, scope: !43)
!56 = !DILocation(line: 48, column: 19, scope: !43)
!57 = !DILocation(line: 48, column: 9, scope: !43)
!58 = !DILocation(line: 49, column: 14, scope: !43)
!59 = !DILocation(line: 49, column: 9, scope: !43)
!60 = !DILocation(line: 51, column: 1, scope: !21)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_05_good", scope: !13, file: !13, line: 110, type: !22, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocation(line: 112, column: 5, scope: !61)
!63 = !DILocation(line: 113, column: 5, scope: !61)
!64 = !DILocation(line: 114, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 126, type: !66, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!66 = !DISubroutineType(types: !67)
!67 = !{!14, !14, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !13, line: 126, type: !14)
!70 = !DILocation(line: 126, column: 14, scope: !65)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !13, line: 126, type: !68)
!72 = !DILocation(line: 126, column: 27, scope: !65)
!73 = !DILocation(line: 129, column: 22, scope: !65)
!74 = !DILocation(line: 129, column: 12, scope: !65)
!75 = !DILocation(line: 129, column: 5, scope: !65)
!76 = !DILocation(line: 131, column: 5, scope: !65)
!77 = !DILocation(line: 132, column: 5, scope: !65)
!78 = !DILocation(line: 133, column: 5, scope: !65)
!79 = !DILocation(line: 136, column: 5, scope: !65)
!80 = !DILocation(line: 137, column: 5, scope: !65)
!81 = !DILocation(line: 138, column: 5, scope: !65)
!82 = !DILocation(line: 140, column: 5, scope: !65)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 58, type: !22, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!84 = !DILocalVariable(name: "data", scope: !83, file: !13, line: 60, type: !6)
!85 = !DILocation(line: 60, column: 12, scope: !83)
!86 = !DILocation(line: 61, column: 10, scope: !83)
!87 = !DILocation(line: 62, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !13, line: 62, column: 8)
!89 = !DILocation(line: 62, column: 8, scope: !83)
!90 = !DILocation(line: 65, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !13, line: 63, column: 5)
!92 = !DILocation(line: 66, column: 5, scope: !91)
!93 = !DILocation(line: 70, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !13, line: 68, column: 5)
!95 = !DILocation(line: 70, column: 14, scope: !94)
!96 = !DILocation(line: 71, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !13, line: 71, column: 13)
!98 = !DILocation(line: 71, column: 18, scope: !97)
!99 = !DILocation(line: 71, column: 13, scope: !94)
!100 = !DILocation(line: 71, column: 28, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !13, line: 71, column: 27)
!102 = !DILocation(line: 72, column: 9, scope: !94)
!103 = !DILocation(line: 72, column: 17, scope: !94)
!104 = !DILocalVariable(name: "source", scope: !105, file: !13, line: 75, type: !44)
!105 = distinct !DILexicalBlock(scope: !83, file: !13, line: 74, column: 5)
!106 = !DILocation(line: 75, column: 14, scope: !105)
!107 = !DILocation(line: 76, column: 9, scope: !105)
!108 = !DILocation(line: 77, column: 9, scope: !105)
!109 = !DILocation(line: 77, column: 23, scope: !105)
!110 = !DILocation(line: 79, column: 17, scope: !105)
!111 = !DILocation(line: 79, column: 23, scope: !105)
!112 = !DILocation(line: 79, column: 9, scope: !105)
!113 = !DILocation(line: 80, column: 9, scope: !105)
!114 = !DILocation(line: 80, column: 21, scope: !105)
!115 = !DILocation(line: 81, column: 19, scope: !105)
!116 = !DILocation(line: 81, column: 9, scope: !105)
!117 = !DILocation(line: 82, column: 14, scope: !105)
!118 = !DILocation(line: 82, column: 9, scope: !105)
!119 = !DILocation(line: 84, column: 1, scope: !83)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 87, type: !22, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!121 = !DILocalVariable(name: "data", scope: !120, file: !13, line: 89, type: !6)
!122 = !DILocation(line: 89, column: 12, scope: !120)
!123 = !DILocation(line: 90, column: 10, scope: !120)
!124 = !DILocation(line: 91, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !120, file: !13, line: 91, column: 8)
!126 = !DILocation(line: 91, column: 8, scope: !120)
!127 = !DILocation(line: 94, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !13, line: 92, column: 5)
!129 = !DILocation(line: 94, column: 14, scope: !128)
!130 = !DILocation(line: 95, column: 13, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !13, line: 95, column: 13)
!132 = !DILocation(line: 95, column: 18, scope: !131)
!133 = !DILocation(line: 95, column: 13, scope: !128)
!134 = !DILocation(line: 95, column: 28, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !13, line: 95, column: 27)
!136 = !DILocation(line: 96, column: 9, scope: !128)
!137 = !DILocation(line: 96, column: 17, scope: !128)
!138 = !DILocation(line: 97, column: 5, scope: !128)
!139 = !DILocalVariable(name: "source", scope: !140, file: !13, line: 99, type: !44)
!140 = distinct !DILexicalBlock(scope: !120, file: !13, line: 98, column: 5)
!141 = !DILocation(line: 99, column: 14, scope: !140)
!142 = !DILocation(line: 100, column: 9, scope: !140)
!143 = !DILocation(line: 101, column: 9, scope: !140)
!144 = !DILocation(line: 101, column: 23, scope: !140)
!145 = !DILocation(line: 103, column: 17, scope: !140)
!146 = !DILocation(line: 103, column: 23, scope: !140)
!147 = !DILocation(line: 103, column: 9, scope: !140)
!148 = !DILocation(line: 104, column: 9, scope: !140)
!149 = !DILocation(line: 104, column: 21, scope: !140)
!150 = !DILocation(line: 105, column: 19, scope: !140)
!151 = !DILocation(line: 105, column: 9, scope: !140)
!152 = !DILocation(line: 106, column: 14, scope: !140)
!153 = !DILocation(line: 106, column: 9, scope: !140)
!154 = !DILocation(line: 108, column: 1, scope: !120)
