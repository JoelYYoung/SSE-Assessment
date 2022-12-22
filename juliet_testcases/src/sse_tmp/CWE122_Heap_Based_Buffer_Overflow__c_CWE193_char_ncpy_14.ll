; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_14_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_14_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %0 = load i32, i32* @globalFive, align 4, !dbg !21
  %cmp = icmp eq i32 %0, 5, !dbg !23
  br i1 %cmp, label %if.then, label %if.end3, !dbg !24

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %cmp1 = icmp eq i8* %1, null, !dbg !30
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !31

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !34

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_14_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !40
  %3 = load i8*, i8** %data, align 8, !dbg !41
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %arraydecay4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !43
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !44
  %add = add i64 %call5, 1, !dbg !45
  %call6 = call i8* @strncpy(i8* %3, i8* %arraydecay, i64 %add) #7, !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %4), !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  call void @free(i8* %5) #7, !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_14_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #7, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #7, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_14_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_14_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i8* null, i8** %data, align 8, !dbg !78
  %0 = load i32, i32* @globalFive, align 4, !dbg !79
  %cmp = icmp ne i32 %0, 5, !dbg !81
  br i1 %cmp, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end3, !dbg !85

if.else:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !86
  store i8* %call, i8** %data, align 8, !dbg !88
  %1 = load i8*, i8** %data, align 8, !dbg !89
  %cmp1 = icmp eq i8* %1, null, !dbg !91
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !92

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %if.else
  br label %if.end3

if.end3:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !97
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !97
  %3 = load i8*, i8** %data, align 8, !dbg !98
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !99
  %arraydecay4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !100
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !101
  %add = add i64 %call5, 1, !dbg !102
  %call6 = call i8* @strncpy(i8* %3, i8* %arraydecay, i64 %add) #7, !dbg !103
  %4 = load i8*, i8** %data, align 8, !dbg !104
  call void @printLine(i8* %4), !dbg !105
  %5 = load i8*, i8** %data, align 8, !dbg !106
  call void @free(i8* %5) #7, !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  store i8* null, i8** %data, align 8, !dbg !112
  %0 = load i32, i32* @globalFive, align 4, !dbg !113
  %cmp = icmp eq i32 %0, 5, !dbg !115
  br i1 %cmp, label %if.then, label %if.end3, !dbg !116

if.then:                                          ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !117
  store i8* %call, i8** %data, align 8, !dbg !119
  %1 = load i8*, i8** %data, align 8, !dbg !120
  %cmp1 = icmp eq i8* %1, null, !dbg !122
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !123

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !124
  unreachable, !dbg !124

if.end:                                           ; preds = %if.then
  br label %if.end3, !dbg !126

if.end3:                                          ; preds = %if.end, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !129
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !129
  %3 = load i8*, i8** %data, align 8, !dbg !130
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !131
  %arraydecay4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !132
  %call5 = call i64 @strlen(i8* %arraydecay4) #9, !dbg !133
  %add = add i64 %call5, 1, !dbg !134
  %call6 = call i8* @strncpy(i8* %3, i8* %arraydecay, i64 %add) #7, !dbg !135
  %4 = load i8*, i8** %data, align 8, !dbg !136
  call void @printLine(i8* %4), !dbg !137
  %5 = load i8*, i8** %data, align 8, !dbg !138
  call void @free(i8* %5) #7, !dbg !139
  ret void, !dbg !140
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_14.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_14_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_14.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 32, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!23 = !DILocation(line: 32, column: 18, scope: !22)
!24 = !DILocation(line: 32, column: 8, scope: !14)
!25 = !DILocation(line: 35, column: 24, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !15, line: 33, column: 5)
!27 = !DILocation(line: 35, column: 14, scope: !26)
!28 = !DILocation(line: 36, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !15, line: 36, column: 13)
!30 = !DILocation(line: 36, column: 18, scope: !29)
!31 = !DILocation(line: 36, column: 13, scope: !26)
!32 = !DILocation(line: 36, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 36, column: 27)
!34 = !DILocation(line: 37, column: 5, scope: !26)
!35 = !DILocalVariable(name: "source", scope: !36, file: !15, line: 39, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 11)
!40 = !DILocation(line: 39, column: 14, scope: !36)
!41 = !DILocation(line: 42, column: 17, scope: !36)
!42 = !DILocation(line: 42, column: 23, scope: !36)
!43 = !DILocation(line: 42, column: 38, scope: !36)
!44 = !DILocation(line: 42, column: 31, scope: !36)
!45 = !DILocation(line: 42, column: 46, scope: !36)
!46 = !DILocation(line: 42, column: 9, scope: !36)
!47 = !DILocation(line: 43, column: 19, scope: !36)
!48 = !DILocation(line: 43, column: 9, scope: !36)
!49 = !DILocation(line: 44, column: 14, scope: !36)
!50 = !DILocation(line: 44, column: 9, scope: !36)
!51 = !DILocation(line: 46, column: 1, scope: !14)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_14_good", scope: !15, file: !15, line: 99, type: !16, scopeLine: 100, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 101, column: 5, scope: !52)
!54 = !DILocation(line: 102, column: 5, scope: !52)
!55 = !DILocation(line: 103, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 115, type: !57, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !15, line: 115, type: !59)
!62 = !DILocation(line: 115, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !15, line: 115, type: !60)
!64 = !DILocation(line: 115, column: 27, scope: !56)
!65 = !DILocation(line: 118, column: 22, scope: !56)
!66 = !DILocation(line: 118, column: 12, scope: !56)
!67 = !DILocation(line: 118, column: 5, scope: !56)
!68 = !DILocation(line: 120, column: 5, scope: !56)
!69 = !DILocation(line: 121, column: 5, scope: !56)
!70 = !DILocation(line: 122, column: 5, scope: !56)
!71 = !DILocation(line: 125, column: 5, scope: !56)
!72 = !DILocation(line: 126, column: 5, scope: !56)
!73 = !DILocation(line: 127, column: 5, scope: !56)
!74 = !DILocation(line: 129, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 53, type: !16, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !15, line: 55, type: !4)
!77 = !DILocation(line: 55, column: 12, scope: !75)
!78 = !DILocation(line: 56, column: 10, scope: !75)
!79 = !DILocation(line: 57, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !15, line: 57, column: 8)
!81 = !DILocation(line: 57, column: 18, scope: !80)
!82 = !DILocation(line: 57, column: 8, scope: !75)
!83 = !DILocation(line: 60, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !15, line: 58, column: 5)
!85 = !DILocation(line: 61, column: 5, scope: !84)
!86 = !DILocation(line: 65, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !80, file: !15, line: 63, column: 5)
!88 = !DILocation(line: 65, column: 14, scope: !87)
!89 = !DILocation(line: 66, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !15, line: 66, column: 13)
!91 = !DILocation(line: 66, column: 18, scope: !90)
!92 = !DILocation(line: 66, column: 13, scope: !87)
!93 = !DILocation(line: 66, column: 28, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !15, line: 66, column: 27)
!95 = !DILocalVariable(name: "source", scope: !96, file: !15, line: 69, type: !37)
!96 = distinct !DILexicalBlock(scope: !75, file: !15, line: 68, column: 5)
!97 = !DILocation(line: 69, column: 14, scope: !96)
!98 = !DILocation(line: 72, column: 17, scope: !96)
!99 = !DILocation(line: 72, column: 23, scope: !96)
!100 = !DILocation(line: 72, column: 38, scope: !96)
!101 = !DILocation(line: 72, column: 31, scope: !96)
!102 = !DILocation(line: 72, column: 46, scope: !96)
!103 = !DILocation(line: 72, column: 9, scope: !96)
!104 = !DILocation(line: 73, column: 19, scope: !96)
!105 = !DILocation(line: 73, column: 9, scope: !96)
!106 = !DILocation(line: 74, column: 14, scope: !96)
!107 = !DILocation(line: 74, column: 9, scope: !96)
!108 = !DILocation(line: 76, column: 1, scope: !75)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 79, type: !16, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!110 = !DILocalVariable(name: "data", scope: !109, file: !15, line: 81, type: !4)
!111 = !DILocation(line: 81, column: 12, scope: !109)
!112 = !DILocation(line: 82, column: 10, scope: !109)
!113 = !DILocation(line: 83, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !109, file: !15, line: 83, column: 8)
!115 = !DILocation(line: 83, column: 18, scope: !114)
!116 = !DILocation(line: 83, column: 8, scope: !109)
!117 = !DILocation(line: 86, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !15, line: 84, column: 5)
!119 = !DILocation(line: 86, column: 14, scope: !118)
!120 = !DILocation(line: 87, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !15, line: 87, column: 13)
!122 = !DILocation(line: 87, column: 18, scope: !121)
!123 = !DILocation(line: 87, column: 13, scope: !118)
!124 = !DILocation(line: 87, column: 28, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 87, column: 27)
!126 = !DILocation(line: 88, column: 5, scope: !118)
!127 = !DILocalVariable(name: "source", scope: !128, file: !15, line: 90, type: !37)
!128 = distinct !DILexicalBlock(scope: !109, file: !15, line: 89, column: 5)
!129 = !DILocation(line: 90, column: 14, scope: !128)
!130 = !DILocation(line: 93, column: 17, scope: !128)
!131 = !DILocation(line: 93, column: 23, scope: !128)
!132 = !DILocation(line: 93, column: 38, scope: !128)
!133 = !DILocation(line: 93, column: 31, scope: !128)
!134 = !DILocation(line: 93, column: 46, scope: !128)
!135 = !DILocation(line: 93, column: 9, scope: !128)
!136 = !DILocation(line: 94, column: 19, scope: !128)
!137 = !DILocation(line: 94, column: 9, scope: !128)
!138 = !DILocation(line: 95, column: 14, scope: !128)
!139 = !DILocation(line: 95, column: 9, scope: !128)
!140 = !DILocation(line: 97, column: 1, scope: !109)
