; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalTrue = external dso_local global i32, align 4
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_10_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_10_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalTrue, align 4, !dbg !21
  %tobool = icmp ne i32 %0, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end2, !dbg !23

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !24
  store i8* %call, i8** %data, align 8, !dbg !26
  %1 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %1, null, !dbg !29
  br i1 %cmp, label %if.then1, label %if.end, !dbg !30

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !33

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !39
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_10_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !39
  %3 = load i8*, i8** %data, align 8, !dbg !40
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !41
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !43
  %add = add i64 %call4, 1, !dbg !44
  %mul = mul i64 %add, 1, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !41
  %4 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %4), !dbg !47
  %5 = load i8*, i8** %data, align 8, !dbg !48
  call void @free(i8* %5) #7, !dbg !49
  ret void, !dbg !50
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

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_10_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_10_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_10_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i8* null, i8** %data, align 8, !dbg !77
  %0 = load i32, i32* @globalFalse, align 4, !dbg !78
  %tobool = icmp ne i32 %0, 0, !dbg !78
  br i1 %tobool, label %if.then, label %if.else, !dbg !80

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  br label %if.end2, !dbg !83

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !84
  store i8* %call, i8** %data, align 8, !dbg !86
  %1 = load i8*, i8** %data, align 8, !dbg !87
  %cmp = icmp eq i8* %1, null, !dbg !89
  br i1 %cmp, label %if.then1, label %if.end, !dbg !90

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %if.else
  br label %if.end2

if.end2:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !95
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !97
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !98
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !99
  %add = add i64 %call4, 1, !dbg !100
  %mul = mul i64 %add, 1, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !97
  %4 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* %4), !dbg !103
  %5 = load i8*, i8** %data, align 8, !dbg !104
  call void @free(i8* %5) #7, !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  store i8* null, i8** %data, align 8, !dbg !110
  %0 = load i32, i32* @globalTrue, align 4, !dbg !111
  %tobool = icmp ne i32 %0, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.end2, !dbg !113

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !114
  store i8* %call, i8** %data, align 8, !dbg !116
  %1 = load i8*, i8** %data, align 8, !dbg !117
  %cmp = icmp eq i8* %1, null, !dbg !119
  br i1 %cmp, label %if.then1, label %if.end, !dbg !120

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %if.then
  br label %if.end2, !dbg !123

if.end2:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !126
  %3 = load i8*, i8** %data, align 8, !dbg !127
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !128
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !129
  %call4 = call i64 @strlen(i8* %arraydecay3) #9, !dbg !130
  %add = add i64 %call4, 1, !dbg !131
  %mul = mul i64 %add, 1, !dbg !132
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !128
  %4 = load i8*, i8** %data, align 8, !dbg !133
  call void @printLine(i8* %4), !dbg !134
  %5 = load i8*, i8** %data, align 8, !dbg !135
  call void @free(i8* %5) #7, !dbg !136
  ret void, !dbg !137
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_10.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_10_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_10.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 32, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!23 = !DILocation(line: 32, column: 8, scope: !14)
!24 = !DILocation(line: 35, column: 24, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !15, line: 33, column: 5)
!26 = !DILocation(line: 35, column: 14, scope: !25)
!27 = !DILocation(line: 36, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !15, line: 36, column: 13)
!29 = !DILocation(line: 36, column: 18, scope: !28)
!30 = !DILocation(line: 36, column: 13, scope: !25)
!31 = !DILocation(line: 36, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 36, column: 27)
!33 = !DILocation(line: 37, column: 5, scope: !25)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 39, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DILocation(line: 39, column: 14, scope: !35)
!40 = !DILocation(line: 42, column: 16, scope: !35)
!41 = !DILocation(line: 42, column: 9, scope: !35)
!42 = !DILocation(line: 42, column: 38, scope: !35)
!43 = !DILocation(line: 42, column: 31, scope: !35)
!44 = !DILocation(line: 42, column: 46, scope: !35)
!45 = !DILocation(line: 42, column: 51, scope: !35)
!46 = !DILocation(line: 43, column: 19, scope: !35)
!47 = !DILocation(line: 43, column: 9, scope: !35)
!48 = !DILocation(line: 44, column: 14, scope: !35)
!49 = !DILocation(line: 44, column: 9, scope: !35)
!50 = !DILocation(line: 46, column: 1, scope: !14)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_10_good", scope: !15, file: !15, line: 99, type: !16, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 101, column: 5, scope: !51)
!53 = !DILocation(line: 102, column: 5, scope: !51)
!54 = !DILocation(line: 103, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 115, type: !56, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !15, line: 115, type: !58)
!61 = !DILocation(line: 115, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !15, line: 115, type: !59)
!63 = !DILocation(line: 115, column: 27, scope: !55)
!64 = !DILocation(line: 118, column: 22, scope: !55)
!65 = !DILocation(line: 118, column: 12, scope: !55)
!66 = !DILocation(line: 118, column: 5, scope: !55)
!67 = !DILocation(line: 120, column: 5, scope: !55)
!68 = !DILocation(line: 121, column: 5, scope: !55)
!69 = !DILocation(line: 122, column: 5, scope: !55)
!70 = !DILocation(line: 125, column: 5, scope: !55)
!71 = !DILocation(line: 126, column: 5, scope: !55)
!72 = !DILocation(line: 127, column: 5, scope: !55)
!73 = !DILocation(line: 129, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 53, type: !16, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !15, line: 55, type: !4)
!76 = !DILocation(line: 55, column: 12, scope: !74)
!77 = !DILocation(line: 56, column: 10, scope: !74)
!78 = !DILocation(line: 57, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !15, line: 57, column: 8)
!80 = !DILocation(line: 57, column: 8, scope: !74)
!81 = !DILocation(line: 60, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !15, line: 58, column: 5)
!83 = !DILocation(line: 61, column: 5, scope: !82)
!84 = !DILocation(line: 65, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !15, line: 63, column: 5)
!86 = !DILocation(line: 65, column: 14, scope: !85)
!87 = !DILocation(line: 66, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !15, line: 66, column: 13)
!89 = !DILocation(line: 66, column: 18, scope: !88)
!90 = !DILocation(line: 66, column: 13, scope: !85)
!91 = !DILocation(line: 66, column: 28, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 66, column: 27)
!93 = !DILocalVariable(name: "source", scope: !94, file: !15, line: 69, type: !36)
!94 = distinct !DILexicalBlock(scope: !74, file: !15, line: 68, column: 5)
!95 = !DILocation(line: 69, column: 14, scope: !94)
!96 = !DILocation(line: 72, column: 16, scope: !94)
!97 = !DILocation(line: 72, column: 9, scope: !94)
!98 = !DILocation(line: 72, column: 38, scope: !94)
!99 = !DILocation(line: 72, column: 31, scope: !94)
!100 = !DILocation(line: 72, column: 46, scope: !94)
!101 = !DILocation(line: 72, column: 51, scope: !94)
!102 = !DILocation(line: 73, column: 19, scope: !94)
!103 = !DILocation(line: 73, column: 9, scope: !94)
!104 = !DILocation(line: 74, column: 14, scope: !94)
!105 = !DILocation(line: 74, column: 9, scope: !94)
!106 = !DILocation(line: 76, column: 1, scope: !74)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 79, type: !16, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !15, line: 81, type: !4)
!109 = !DILocation(line: 81, column: 12, scope: !107)
!110 = !DILocation(line: 82, column: 10, scope: !107)
!111 = !DILocation(line: 83, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !15, line: 83, column: 8)
!113 = !DILocation(line: 83, column: 8, scope: !107)
!114 = !DILocation(line: 86, column: 24, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !15, line: 84, column: 5)
!116 = !DILocation(line: 86, column: 14, scope: !115)
!117 = !DILocation(line: 87, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !15, line: 87, column: 13)
!119 = !DILocation(line: 87, column: 18, scope: !118)
!120 = !DILocation(line: 87, column: 13, scope: !115)
!121 = !DILocation(line: 87, column: 28, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !15, line: 87, column: 27)
!123 = !DILocation(line: 88, column: 5, scope: !115)
!124 = !DILocalVariable(name: "source", scope: !125, file: !15, line: 90, type: !36)
!125 = distinct !DILexicalBlock(scope: !107, file: !15, line: 89, column: 5)
!126 = !DILocation(line: 90, column: 14, scope: !125)
!127 = !DILocation(line: 93, column: 16, scope: !125)
!128 = !DILocation(line: 93, column: 9, scope: !125)
!129 = !DILocation(line: 93, column: 38, scope: !125)
!130 = !DILocation(line: 93, column: 31, scope: !125)
!131 = !DILocation(line: 93, column: 46, scope: !125)
!132 = !DILocation(line: 93, column: 51, scope: !125)
!133 = !DILocation(line: 94, column: 19, scope: !125)
!134 = !DILocation(line: 94, column: 9, scope: !125)
!135 = !DILocation(line: 95, column: 14, scope: !125)
!136 = !DILocation(line: 95, column: 9, scope: !125)
!137 = !DILocation(line: 97, column: 1, scope: !107)
