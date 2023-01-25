; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_07_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %0 = load i32, i32* @staticFive, align 4, !dbg !25
  %cmp = icmp eq i32 %0, 5, !dbg !27
  br i1 %cmp, label %if.then, label %if.end3, !dbg !28

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !29
  store i8* %call, i8** %data, align 8, !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %cmp1 = icmp eq i8* %1, null, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !38

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_07_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !44
  %3 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !46
  %arraydecay4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !48
  %add = add i64 %call5, 1, !dbg !49
  %mul = mul i64 %add, 1, !dbg !50
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* %4), !dbg !52
  %5 = load i8*, i8** %data, align 8, !dbg !53
  call void @free(i8* %5) #7, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_07_good() #0 !dbg !56 {
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
  %call = call i64 @time(i64* null) #7, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #7, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_07_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_07_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i8* null, i8** %data, align 8, !dbg !81
  %0 = load i32, i32* @staticFive, align 4, !dbg !82
  %cmp = icmp ne i32 %0, 5, !dbg !84
  br i1 %cmp, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end3, !dbg !88

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !89
  store i8* %call, i8** %data, align 8, !dbg !91
  %1 = load i8*, i8** %data, align 8, !dbg !92
  %cmp1 = icmp eq i8* %1, null, !dbg !94
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !95

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !100
  %3 = load i8*, i8** %data, align 8, !dbg !101
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !102
  %arraydecay4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !103
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !104
  %add = add i64 %call5, 1, !dbg !105
  %mul = mul i64 %add, 1, !dbg !106
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !102
  %4 = load i8*, i8** %data, align 8, !dbg !107
  call void @printLine(i8* %4), !dbg !108
  %5 = load i8*, i8** %data, align 8, !dbg !109
  call void @free(i8* %5) #7, !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  store i8* null, i8** %data, align 8, !dbg !115
  %0 = load i32, i32* @staticFive, align 4, !dbg !116
  %cmp = icmp eq i32 %0, 5, !dbg !118
  br i1 %cmp, label %if.then, label %if.end3, !dbg !119

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !120
  store i8* %call, i8** %data, align 8, !dbg !122
  %1 = load i8*, i8** %data, align 8, !dbg !123
  %cmp1 = icmp eq i8* %1, null, !dbg !125
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !126

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !127
  unreachable, !dbg !127

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !129

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !132
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !132
  %3 = load i8*, i8** %data, align 8, !dbg !133
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !134
  %arraydecay4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !135
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !136
  %add = add i64 %call5, 1, !dbg !137
  %mul = mul i64 %add, 1, !dbg !138
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !134
  %4 = load i8*, i8** %data, align 8, !dbg !139
  call void @printLine(i8* %4), !dbg !140
  %5 = load i8*, i8** %data, align 8, !dbg !141
  call void @free(i8* %5) #7, !dbg !142
  ret void, !dbg !143
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !11, line: 30, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !10, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8, !9}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0}
!11 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_07.c", directory: "/home/joelyang/SSE-Assessment")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_07_bad", scope: !11, file: !11, line: 34, type: !20, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 36, type: !6)
!23 = !DILocation(line: 36, column: 12, scope: !19)
!24 = !DILocation(line: 37, column: 10, scope: !19)
!25 = !DILocation(line: 38, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !19, file: !11, line: 38, column: 8)
!27 = !DILocation(line: 38, column: 18, scope: !26)
!28 = !DILocation(line: 38, column: 8, scope: !19)
!29 = !DILocation(line: 41, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !11, line: 39, column: 5)
!31 = !DILocation(line: 41, column: 14, scope: !30)
!32 = !DILocation(line: 42, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !11, line: 42, column: 13)
!34 = !DILocation(line: 42, column: 18, scope: !33)
!35 = !DILocation(line: 42, column: 13, scope: !30)
!36 = !DILocation(line: 42, column: 28, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !11, line: 42, column: 27)
!38 = !DILocation(line: 43, column: 5, scope: !30)
!39 = !DILocalVariable(name: "source", scope: !40, file: !11, line: 45, type: !41)
!40 = distinct !DILexicalBlock(scope: !19, file: !11, line: 44, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 88, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DILocation(line: 45, column: 14, scope: !40)
!45 = !DILocation(line: 48, column: 17, scope: !40)
!46 = !DILocation(line: 48, column: 9, scope: !40)
!47 = !DILocation(line: 48, column: 39, scope: !40)
!48 = !DILocation(line: 48, column: 32, scope: !40)
!49 = !DILocation(line: 48, column: 47, scope: !40)
!50 = !DILocation(line: 48, column: 52, scope: !40)
!51 = !DILocation(line: 49, column: 19, scope: !40)
!52 = !DILocation(line: 49, column: 9, scope: !40)
!53 = !DILocation(line: 50, column: 14, scope: !40)
!54 = !DILocation(line: 50, column: 9, scope: !40)
!55 = !DILocation(line: 52, column: 1, scope: !19)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_07_good", scope: !11, file: !11, line: 105, type: !20, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocation(line: 107, column: 5, scope: !56)
!58 = !DILocation(line: 108, column: 5, scope: !56)
!59 = !DILocation(line: 109, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 121, type: !61, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!12, !12, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !11, line: 121, type: !12)
!65 = !DILocation(line: 121, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !11, line: 121, type: !63)
!67 = !DILocation(line: 121, column: 27, scope: !60)
!68 = !DILocation(line: 124, column: 22, scope: !60)
!69 = !DILocation(line: 124, column: 12, scope: !60)
!70 = !DILocation(line: 124, column: 5, scope: !60)
!71 = !DILocation(line: 126, column: 5, scope: !60)
!72 = !DILocation(line: 127, column: 5, scope: !60)
!73 = !DILocation(line: 128, column: 5, scope: !60)
!74 = !DILocation(line: 131, column: 5, scope: !60)
!75 = !DILocation(line: 132, column: 5, scope: !60)
!76 = !DILocation(line: 133, column: 5, scope: !60)
!77 = !DILocation(line: 135, column: 5, scope: !60)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 59, type: !20, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DILocalVariable(name: "data", scope: !78, file: !11, line: 61, type: !6)
!80 = !DILocation(line: 61, column: 12, scope: !78)
!81 = !DILocation(line: 62, column: 10, scope: !78)
!82 = !DILocation(line: 63, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !11, line: 63, column: 8)
!84 = !DILocation(line: 63, column: 18, scope: !83)
!85 = !DILocation(line: 63, column: 8, scope: !78)
!86 = !DILocation(line: 66, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !11, line: 64, column: 5)
!88 = !DILocation(line: 67, column: 5, scope: !87)
!89 = !DILocation(line: 71, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !11, line: 69, column: 5)
!91 = !DILocation(line: 71, column: 14, scope: !90)
!92 = !DILocation(line: 72, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !11, line: 72, column: 13)
!94 = !DILocation(line: 72, column: 18, scope: !93)
!95 = !DILocation(line: 72, column: 13, scope: !90)
!96 = !DILocation(line: 72, column: 28, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !11, line: 72, column: 27)
!98 = !DILocalVariable(name: "source", scope: !99, file: !11, line: 75, type: !41)
!99 = distinct !DILexicalBlock(scope: !78, file: !11, line: 74, column: 5)
!100 = !DILocation(line: 75, column: 14, scope: !99)
!101 = !DILocation(line: 78, column: 17, scope: !99)
!102 = !DILocation(line: 78, column: 9, scope: !99)
!103 = !DILocation(line: 78, column: 39, scope: !99)
!104 = !DILocation(line: 78, column: 32, scope: !99)
!105 = !DILocation(line: 78, column: 47, scope: !99)
!106 = !DILocation(line: 78, column: 52, scope: !99)
!107 = !DILocation(line: 79, column: 19, scope: !99)
!108 = !DILocation(line: 79, column: 9, scope: !99)
!109 = !DILocation(line: 80, column: 14, scope: !99)
!110 = !DILocation(line: 80, column: 9, scope: !99)
!111 = !DILocation(line: 82, column: 1, scope: !78)
!112 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 85, type: !20, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", scope: !112, file: !11, line: 87, type: !6)
!114 = !DILocation(line: 87, column: 12, scope: !112)
!115 = !DILocation(line: 88, column: 10, scope: !112)
!116 = !DILocation(line: 89, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !11, line: 89, column: 8)
!118 = !DILocation(line: 89, column: 18, scope: !117)
!119 = !DILocation(line: 89, column: 8, scope: !112)
!120 = !DILocation(line: 92, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !11, line: 90, column: 5)
!122 = !DILocation(line: 92, column: 14, scope: !121)
!123 = !DILocation(line: 93, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !11, line: 93, column: 13)
!125 = !DILocation(line: 93, column: 18, scope: !124)
!126 = !DILocation(line: 93, column: 13, scope: !121)
!127 = !DILocation(line: 93, column: 28, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !11, line: 93, column: 27)
!129 = !DILocation(line: 94, column: 5, scope: !121)
!130 = !DILocalVariable(name: "source", scope: !131, file: !11, line: 96, type: !41)
!131 = distinct !DILexicalBlock(scope: !112, file: !11, line: 95, column: 5)
!132 = !DILocation(line: 96, column: 14, scope: !131)
!133 = !DILocation(line: 99, column: 17, scope: !131)
!134 = !DILocation(line: 99, column: 9, scope: !131)
!135 = !DILocation(line: 99, column: 39, scope: !131)
!136 = !DILocation(line: 99, column: 32, scope: !131)
!137 = !DILocation(line: 99, column: 47, scope: !131)
!138 = !DILocation(line: 99, column: 52, scope: !131)
!139 = !DILocation(line: 100, column: 19, scope: !131)
!140 = !DILocation(line: 100, column: 9, scope: !131)
!141 = !DILocation(line: 101, column: 14, scope: !131)
!142 = !DILocation(line: 101, column: 9, scope: !131)
!143 = !DILocation(line: 103, column: 1, scope: !112)
