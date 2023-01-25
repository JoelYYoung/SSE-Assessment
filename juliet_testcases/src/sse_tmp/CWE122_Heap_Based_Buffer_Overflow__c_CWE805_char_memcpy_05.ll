; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_05.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @staticTrue, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end2, !dbg !29

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !30
  store i8* %call, i8** %data, align 8, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  %cmp = icmp eq i8* %1, null, !dbg !35
  br i1 %cmp, label %if.then1, label %if.end, !dbg !36

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !37
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !52
  %4 = load i8*, i8** %data, align 8, !dbg !53
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !53
  store i8 0, i8* %arrayidx5, align 1, !dbg !54
  %5 = load i8*, i8** %data, align 8, !dbg !55
  call void @printLine(i8* %5), !dbg !56
  %6 = load i8*, i8** %data, align 8, !dbg !57
  call void @free(i8* %6) #7, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_05_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #7, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #7, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_05_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_05_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i8* null, i8** %data, align 8, !dbg !85
  %0 = load i32, i32* @staticFalse, align 4, !dbg !86
  %tobool = icmp ne i32 %0, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end2, !dbg !91

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !92
  store i8* %call, i8** %data, align 8, !dbg !94
  %1 = load i8*, i8** %data, align 8, !dbg !95
  %cmp = icmp eq i8* %1, null, !dbg !97
  br i1 %cmp, label %if.then1, label %if.end, !dbg !98

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %if.else
  %2 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !106
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !107
  store i8 0, i8* %arrayidx3, align 1, !dbg !108
  %3 = load i8*, i8** %data, align 8, !dbg !109
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !110
  %4 = load i8*, i8** %data, align 8, !dbg !111
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !111
  store i8 0, i8* %arrayidx5, align 1, !dbg !112
  %5 = load i8*, i8** %data, align 8, !dbg !113
  call void @printLine(i8* %5), !dbg !114
  %6 = load i8*, i8** %data, align 8, !dbg !115
  call void @free(i8* %6) #7, !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !118 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !119, metadata !DIExpression()), !dbg !120
  store i8* null, i8** %data, align 8, !dbg !121
  %0 = load i32, i32* @staticTrue, align 4, !dbg !122
  %tobool = icmp ne i32 %0, 0, !dbg !122
  br i1 %tobool, label %if.then, label %if.end2, !dbg !124

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !125
  store i8* %call, i8** %data, align 8, !dbg !127
  %1 = load i8*, i8** %data, align 8, !dbg !128
  %cmp = icmp eq i8* %1, null, !dbg !130
  br i1 %cmp, label %if.then1, label %if.end, !dbg !131

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !132
  unreachable, !dbg !132

if.end:                                           ; preds = %if.then
  %2 = load i8*, i8** %data, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !134
  store i8 0, i8* %arrayidx, align 1, !dbg !135
  br label %if.end2, !dbg !136

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !137, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !140
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx3, align 1, !dbg !142
  %3 = load i8*, i8** %data, align 8, !dbg !143
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !144
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 16 %arraydecay4, i64 100, i1 false), !dbg !144
  %4 = load i8*, i8** %data, align 8, !dbg !145
  %arrayidx5 = getelementptr inbounds i8, i8* %4, i64 99, !dbg !145
  store i8 0, i8* %arrayidx5, align 1, !dbg !146
  %5 = load i8*, i8** %data, align 8, !dbg !147
  call void @printLine(i8* %5), !dbg !148
  %6 = load i8*, i8** %data, align 8, !dbg !149
  call void @free(i8* %6) #7, !dbg !150
  ret void, !dbg !151
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 25, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 26, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_05.c", directory: "/home/joelyang/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_05_bad", scope: !13, file: !13, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!51 = !DILocation(line: 46, column: 16, scope: !43)
!52 = !DILocation(line: 46, column: 9, scope: !43)
!53 = !DILocation(line: 47, column: 9, scope: !43)
!54 = !DILocation(line: 47, column: 21, scope: !43)
!55 = !DILocation(line: 48, column: 19, scope: !43)
!56 = !DILocation(line: 48, column: 9, scope: !43)
!57 = !DILocation(line: 49, column: 14, scope: !43)
!58 = !DILocation(line: 49, column: 9, scope: !43)
!59 = !DILocation(line: 51, column: 1, scope: !21)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_05_good", scope: !13, file: !13, line: 110, type: !22, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DILocation(line: 112, column: 5, scope: !60)
!62 = !DILocation(line: 113, column: 5, scope: !60)
!63 = !DILocation(line: 114, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 126, type: !65, scopeLine: 127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!65 = !DISubroutineType(types: !66)
!66 = !{!14, !14, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !13, line: 126, type: !14)
!69 = !DILocation(line: 126, column: 14, scope: !64)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !13, line: 126, type: !67)
!71 = !DILocation(line: 126, column: 27, scope: !64)
!72 = !DILocation(line: 129, column: 22, scope: !64)
!73 = !DILocation(line: 129, column: 12, scope: !64)
!74 = !DILocation(line: 129, column: 5, scope: !64)
!75 = !DILocation(line: 131, column: 5, scope: !64)
!76 = !DILocation(line: 132, column: 5, scope: !64)
!77 = !DILocation(line: 133, column: 5, scope: !64)
!78 = !DILocation(line: 136, column: 5, scope: !64)
!79 = !DILocation(line: 137, column: 5, scope: !64)
!80 = !DILocation(line: 138, column: 5, scope: !64)
!81 = !DILocation(line: 140, column: 5, scope: !64)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 58, type: !22, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DILocalVariable(name: "data", scope: !82, file: !13, line: 60, type: !6)
!84 = !DILocation(line: 60, column: 12, scope: !82)
!85 = !DILocation(line: 61, column: 10, scope: !82)
!86 = !DILocation(line: 62, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !13, line: 62, column: 8)
!88 = !DILocation(line: 62, column: 8, scope: !82)
!89 = !DILocation(line: 65, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !13, line: 63, column: 5)
!91 = !DILocation(line: 66, column: 5, scope: !90)
!92 = !DILocation(line: 70, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !13, line: 68, column: 5)
!94 = !DILocation(line: 70, column: 14, scope: !93)
!95 = !DILocation(line: 71, column: 13, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !13, line: 71, column: 13)
!97 = !DILocation(line: 71, column: 18, scope: !96)
!98 = !DILocation(line: 71, column: 13, scope: !93)
!99 = !DILocation(line: 71, column: 28, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !13, line: 71, column: 27)
!101 = !DILocation(line: 72, column: 9, scope: !93)
!102 = !DILocation(line: 72, column: 17, scope: !93)
!103 = !DILocalVariable(name: "source", scope: !104, file: !13, line: 75, type: !44)
!104 = distinct !DILexicalBlock(scope: !82, file: !13, line: 74, column: 5)
!105 = !DILocation(line: 75, column: 14, scope: !104)
!106 = !DILocation(line: 76, column: 9, scope: !104)
!107 = !DILocation(line: 77, column: 9, scope: !104)
!108 = !DILocation(line: 77, column: 23, scope: !104)
!109 = !DILocation(line: 79, column: 16, scope: !104)
!110 = !DILocation(line: 79, column: 9, scope: !104)
!111 = !DILocation(line: 80, column: 9, scope: !104)
!112 = !DILocation(line: 80, column: 21, scope: !104)
!113 = !DILocation(line: 81, column: 19, scope: !104)
!114 = !DILocation(line: 81, column: 9, scope: !104)
!115 = !DILocation(line: 82, column: 14, scope: !104)
!116 = !DILocation(line: 82, column: 9, scope: !104)
!117 = !DILocation(line: 84, column: 1, scope: !82)
!118 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 87, type: !22, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!119 = !DILocalVariable(name: "data", scope: !118, file: !13, line: 89, type: !6)
!120 = !DILocation(line: 89, column: 12, scope: !118)
!121 = !DILocation(line: 90, column: 10, scope: !118)
!122 = !DILocation(line: 91, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !13, line: 91, column: 8)
!124 = !DILocation(line: 91, column: 8, scope: !118)
!125 = !DILocation(line: 94, column: 24, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !13, line: 92, column: 5)
!127 = !DILocation(line: 94, column: 14, scope: !126)
!128 = !DILocation(line: 95, column: 13, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !13, line: 95, column: 13)
!130 = !DILocation(line: 95, column: 18, scope: !129)
!131 = !DILocation(line: 95, column: 13, scope: !126)
!132 = !DILocation(line: 95, column: 28, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !13, line: 95, column: 27)
!134 = !DILocation(line: 96, column: 9, scope: !126)
!135 = !DILocation(line: 96, column: 17, scope: !126)
!136 = !DILocation(line: 97, column: 5, scope: !126)
!137 = !DILocalVariable(name: "source", scope: !138, file: !13, line: 99, type: !44)
!138 = distinct !DILexicalBlock(scope: !118, file: !13, line: 98, column: 5)
!139 = !DILocation(line: 99, column: 14, scope: !138)
!140 = !DILocation(line: 100, column: 9, scope: !138)
!141 = !DILocation(line: 101, column: 9, scope: !138)
!142 = !DILocation(line: 101, column: 23, scope: !138)
!143 = !DILocation(line: 103, column: 16, scope: !138)
!144 = !DILocation(line: 103, column: 9, scope: !138)
!145 = !DILocation(line: 104, column: 9, scope: !138)
!146 = !DILocation(line: 104, column: 21, scope: !138)
!147 = !DILocation(line: 105, column: 19, scope: !138)
!148 = !DILocation(line: 105, column: 9, scope: !138)
!149 = !DILocation(line: 106, column: 14, scope: !138)
!150 = !DILocation(line: 106, column: 9, scope: !138)
!151 = !DILocation(line: 108, column: 1, scope: !118)
