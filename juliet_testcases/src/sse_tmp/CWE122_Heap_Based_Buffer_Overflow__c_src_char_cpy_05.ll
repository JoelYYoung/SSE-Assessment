; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_05.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_05_bad() #0 !dbg !21 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %1, 0, !dbg !34
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !36

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 99, i1 false), !dbg !39
  %3 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  br label %if.end2, !dbg !42

if.end2:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !48
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !49
  %5 = load i8*, i8** %data, align 8, !dbg !50
  %call3 = call i8* @strcpy(i8* %arraydecay, i8* %5) #6, !dbg !51
  %6 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* %6), !dbg !53
  %7 = load i8*, i8** %data, align 8, !dbg !54
  call void @free(i8* %7) #6, !dbg !55
  ret void, !dbg !56
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

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_05_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* null) #6, !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 %conv) #6, !dbg !71
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_05_good(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_05_bad(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !82
  store i8* %call, i8** %data, align 8, !dbg !83
  %0 = load i8*, i8** %data, align 8, !dbg !84
  %cmp = icmp eq i8* %0, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFalse, align 4, !dbg !90
  %tobool = icmp ne i32 %1, 0, !dbg !90
  br i1 %tobool, label %if.then1, label %if.else, !dbg !92

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end2, !dbg !95

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !98
  %3 = load i8*, i8** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  br label %if.end2

if.end2:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !103
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !104
  %5 = load i8*, i8** %data, align 8, !dbg !105
  %call3 = call i8* @strcpy(i8* %arraydecay, i8* %5) #6, !dbg !106
  %6 = load i8*, i8** %data, align 8, !dbg !107
  call void @printLine(i8* %6), !dbg !108
  %7 = load i8*, i8** %data, align 8, !dbg !109
  call void @free(i8* %7) #6, !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !115
  store i8* %call, i8** %data, align 8, !dbg !116
  %0 = load i8*, i8** %data, align 8, !dbg !117
  %cmp = icmp eq i8* %0, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !123
  %tobool = icmp ne i32 %1, 0, !dbg !123
  br i1 %tobool, label %if.then1, label %if.end2, !dbg !125

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !128
  %3 = load i8*, i8** %data, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !129
  store i8 0, i8* %arrayidx, align 1, !dbg !130
  br label %if.end2, !dbg !131

if.end2:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !132, metadata !DIExpression()), !dbg !134
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !134
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !135
  %5 = load i8*, i8** %data, align 8, !dbg !136
  %call3 = call i8* @strcpy(i8* %arraydecay, i8* %5) #6, !dbg !137
  %6 = load i8*, i8** %data, align 8, !dbg !138
  call void @printLine(i8* %6), !dbg !139
  %7 = load i8*, i8** %data, align 8, !dbg !140
  call void @free(i8* %7) #6, !dbg !141
  ret void, !dbg !142
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
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 26, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_05.c", directory: "/root/SSE-Assessment")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"clang version 13.0.0"}
!21 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_05_bad", scope: !13, file: !13, line: 30, type: !22, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 32, type: !6)
!25 = !DILocation(line: 32, column: 12, scope: !21)
!26 = !DILocation(line: 33, column: 20, scope: !21)
!27 = !DILocation(line: 33, column: 10, scope: !21)
!28 = !DILocation(line: 34, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 9)
!30 = !DILocation(line: 34, column: 14, scope: !29)
!31 = !DILocation(line: 34, column: 9, scope: !21)
!32 = !DILocation(line: 34, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !13, line: 34, column: 23)
!34 = !DILocation(line: 35, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !13, line: 35, column: 8)
!36 = !DILocation(line: 35, column: 8, scope: !21)
!37 = !DILocation(line: 38, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !13, line: 36, column: 5)
!39 = !DILocation(line: 38, column: 9, scope: !38)
!40 = !DILocation(line: 39, column: 9, scope: !38)
!41 = !DILocation(line: 39, column: 21, scope: !38)
!42 = !DILocation(line: 40, column: 5, scope: !38)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !13, line: 42, type: !45)
!44 = distinct !DILexicalBlock(scope: !21, file: !13, line: 41, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 42, column: 14, scope: !44)
!49 = !DILocation(line: 44, column: 16, scope: !44)
!50 = !DILocation(line: 44, column: 22, scope: !44)
!51 = !DILocation(line: 44, column: 9, scope: !44)
!52 = !DILocation(line: 45, column: 19, scope: !44)
!53 = !DILocation(line: 45, column: 9, scope: !44)
!54 = !DILocation(line: 46, column: 14, scope: !44)
!55 = !DILocation(line: 46, column: 9, scope: !44)
!56 = !DILocation(line: 48, column: 1, scope: !21)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_05_good", scope: !13, file: !13, line: 101, type: !22, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!58 = !DILocation(line: 103, column: 5, scope: !57)
!59 = !DILocation(line: 104, column: 5, scope: !57)
!60 = !DILocation(line: 105, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 117, type: !62, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!14, !14, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !13, line: 117, type: !14)
!66 = !DILocation(line: 117, column: 14, scope: !61)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !13, line: 117, type: !64)
!68 = !DILocation(line: 117, column: 27, scope: !61)
!69 = !DILocation(line: 120, column: 22, scope: !61)
!70 = !DILocation(line: 120, column: 12, scope: !61)
!71 = !DILocation(line: 120, column: 5, scope: !61)
!72 = !DILocation(line: 122, column: 5, scope: !61)
!73 = !DILocation(line: 123, column: 5, scope: !61)
!74 = !DILocation(line: 124, column: 5, scope: !61)
!75 = !DILocation(line: 127, column: 5, scope: !61)
!76 = !DILocation(line: 128, column: 5, scope: !61)
!77 = !DILocation(line: 129, column: 5, scope: !61)
!78 = !DILocation(line: 131, column: 5, scope: !61)
!79 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 55, type: !22, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocalVariable(name: "data", scope: !79, file: !13, line: 57, type: !6)
!81 = !DILocation(line: 57, column: 12, scope: !79)
!82 = !DILocation(line: 58, column: 20, scope: !79)
!83 = !DILocation(line: 58, column: 10, scope: !79)
!84 = !DILocation(line: 59, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !13, line: 59, column: 9)
!86 = !DILocation(line: 59, column: 14, scope: !85)
!87 = !DILocation(line: 59, column: 9, scope: !79)
!88 = !DILocation(line: 59, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !13, line: 59, column: 23)
!90 = !DILocation(line: 60, column: 8, scope: !91)
!91 = distinct !DILexicalBlock(scope: !79, file: !13, line: 60, column: 8)
!92 = !DILocation(line: 60, column: 8, scope: !79)
!93 = !DILocation(line: 63, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !13, line: 61, column: 5)
!95 = !DILocation(line: 64, column: 5, scope: !94)
!96 = !DILocation(line: 68, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !13, line: 66, column: 5)
!98 = !DILocation(line: 68, column: 9, scope: !97)
!99 = !DILocation(line: 69, column: 9, scope: !97)
!100 = !DILocation(line: 69, column: 20, scope: !97)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !13, line: 72, type: !45)
!102 = distinct !DILexicalBlock(scope: !79, file: !13, line: 71, column: 5)
!103 = !DILocation(line: 72, column: 14, scope: !102)
!104 = !DILocation(line: 74, column: 16, scope: !102)
!105 = !DILocation(line: 74, column: 22, scope: !102)
!106 = !DILocation(line: 74, column: 9, scope: !102)
!107 = !DILocation(line: 75, column: 19, scope: !102)
!108 = !DILocation(line: 75, column: 9, scope: !102)
!109 = !DILocation(line: 76, column: 14, scope: !102)
!110 = !DILocation(line: 76, column: 9, scope: !102)
!111 = !DILocation(line: 78, column: 1, scope: !79)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 81, type: !22, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !13, line: 83, type: !6)
!114 = !DILocation(line: 83, column: 12, scope: !112)
!115 = !DILocation(line: 84, column: 20, scope: !112)
!116 = !DILocation(line: 84, column: 10, scope: !112)
!117 = !DILocation(line: 85, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !13, line: 85, column: 9)
!119 = !DILocation(line: 85, column: 14, scope: !118)
!120 = !DILocation(line: 85, column: 9, scope: !112)
!121 = !DILocation(line: 85, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !13, line: 85, column: 23)
!123 = !DILocation(line: 86, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !112, file: !13, line: 86, column: 8)
!125 = !DILocation(line: 86, column: 8, scope: !112)
!126 = !DILocation(line: 89, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !13, line: 87, column: 5)
!128 = !DILocation(line: 89, column: 9, scope: !127)
!129 = !DILocation(line: 90, column: 9, scope: !127)
!130 = !DILocation(line: 90, column: 20, scope: !127)
!131 = !DILocation(line: 91, column: 5, scope: !127)
!132 = !DILocalVariable(name: "dest", scope: !133, file: !13, line: 93, type: !45)
!133 = distinct !DILexicalBlock(scope: !112, file: !13, line: 92, column: 5)
!134 = !DILocation(line: 93, column: 14, scope: !133)
!135 = !DILocation(line: 95, column: 16, scope: !133)
!136 = !DILocation(line: 95, column: 22, scope: !133)
!137 = !DILocation(line: 95, column: 9, scope: !133)
!138 = !DILocation(line: 96, column: 19, scope: !133)
!139 = !DILocation(line: 96, column: 9, scope: !133)
!140 = !DILocation(line: 97, column: 14, scope: !133)
!141 = !DILocation(line: 97, column: 9, scope: !133)
!142 = !DILocation(line: 99, column: 1, scope: !112)
