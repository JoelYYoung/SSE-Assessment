; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_31.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_31.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_31_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !29, metadata !DIExpression()), !dbg !31
  %1 = load i8*, i8** %data, align 8, !dbg !32
  store i8* %1, i8** %dataCopy, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !33, metadata !DIExpression()), !dbg !34
  %2 = load i8*, i8** %dataCopy, align 8, !dbg !35
  store i8* %2, i8** %data1, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_31_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !41
  %4 = load i8*, i8** %data1, align 8, !dbg !42
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !43
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !44
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !45
  %add = add i64 %call3, 1, !dbg !46
  %call4 = call i8* @strncpy(i8* %4, i8* %arraydecay, i64 %add) #7, !dbg !47
  %5 = load i8*, i8** %data1, align 8, !dbg !48
  call void @printLine(i8* %5), !dbg !49
  %6 = load i8*, i8** %data1, align 8, !dbg !50
  call void @free(i8* %6) #7, !dbg !51
  ret void, !dbg !52
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_31_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_31_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_31_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i8* null, i8** %data, align 8, !dbg !78
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !79
  store i8* %call, i8** %data, align 8, !dbg !80
  %0 = load i8*, i8** %data, align 8, !dbg !81
  %cmp = icmp eq i8* %0, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !87, metadata !DIExpression()), !dbg !89
  %1 = load i8*, i8** %data, align 8, !dbg !90
  store i8* %1, i8** %dataCopy, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !91, metadata !DIExpression()), !dbg !92
  %2 = load i8*, i8** %dataCopy, align 8, !dbg !93
  store i8* %2, i8** %data1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !96
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !96
  %4 = load i8*, i8** %data1, align 8, !dbg !97
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !98
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !99
  %call3 = call i64 @strlen(i8* %arraydecay2) #9, !dbg !100
  %add = add i64 %call3, 1, !dbg !101
  %call4 = call i8* @strncpy(i8* %4, i8* %arraydecay, i64 %add) #7, !dbg !102
  %5 = load i8*, i8** %data1, align 8, !dbg !103
  call void @printLine(i8* %5), !dbg !104
  %6 = load i8*, i8** %data1, align 8, !dbg !105
  call void @free(i8* %6) #7, !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_31.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_31_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_31.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !4)
!19 = !DILocation(line: 30, column: 12, scope: !14)
!20 = !DILocation(line: 31, column: 10, scope: !14)
!21 = !DILocation(line: 33, column: 20, scope: !14)
!22 = !DILocation(line: 33, column: 10, scope: !14)
!23 = !DILocation(line: 34, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 9)
!25 = !DILocation(line: 34, column: 14, scope: !24)
!26 = !DILocation(line: 34, column: 9, scope: !14)
!27 = !DILocation(line: 34, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 34, column: 23)
!29 = !DILocalVariable(name: "dataCopy", scope: !30, file: !15, line: 36, type: !4)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!31 = !DILocation(line: 36, column: 16, scope: !30)
!32 = !DILocation(line: 36, column: 27, scope: !30)
!33 = !DILocalVariable(name: "data", scope: !30, file: !15, line: 37, type: !4)
!34 = !DILocation(line: 37, column: 16, scope: !30)
!35 = !DILocation(line: 37, column: 23, scope: !30)
!36 = !DILocalVariable(name: "source", scope: !37, file: !15, line: 39, type: !38)
!37 = distinct !DILexicalBlock(scope: !30, file: !15, line: 38, column: 9)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 11)
!41 = !DILocation(line: 39, column: 18, scope: !37)
!42 = !DILocation(line: 42, column: 21, scope: !37)
!43 = !DILocation(line: 42, column: 27, scope: !37)
!44 = !DILocation(line: 42, column: 42, scope: !37)
!45 = !DILocation(line: 42, column: 35, scope: !37)
!46 = !DILocation(line: 42, column: 50, scope: !37)
!47 = !DILocation(line: 42, column: 13, scope: !37)
!48 = !DILocation(line: 43, column: 23, scope: !37)
!49 = !DILocation(line: 43, column: 13, scope: !37)
!50 = !DILocation(line: 44, column: 18, scope: !37)
!51 = !DILocation(line: 44, column: 13, scope: !37)
!52 = !DILocation(line: 47, column: 1, scope: !14)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_31_good", scope: !15, file: !15, line: 75, type: !16, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 77, column: 5, scope: !53)
!55 = !DILocation(line: 78, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 89, type: !57, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !15, line: 89, type: !59)
!62 = !DILocation(line: 89, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !15, line: 89, type: !60)
!64 = !DILocation(line: 89, column: 27, scope: !56)
!65 = !DILocation(line: 92, column: 22, scope: !56)
!66 = !DILocation(line: 92, column: 12, scope: !56)
!67 = !DILocation(line: 92, column: 5, scope: !56)
!68 = !DILocation(line: 94, column: 5, scope: !56)
!69 = !DILocation(line: 95, column: 5, scope: !56)
!70 = !DILocation(line: 96, column: 5, scope: !56)
!71 = !DILocation(line: 99, column: 5, scope: !56)
!72 = !DILocation(line: 100, column: 5, scope: !56)
!73 = !DILocation(line: 101, column: 5, scope: !56)
!74 = !DILocation(line: 103, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !15, line: 56, type: !4)
!77 = !DILocation(line: 56, column: 12, scope: !75)
!78 = !DILocation(line: 57, column: 10, scope: !75)
!79 = !DILocation(line: 59, column: 20, scope: !75)
!80 = !DILocation(line: 59, column: 10, scope: !75)
!81 = !DILocation(line: 60, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !75, file: !15, line: 60, column: 9)
!83 = !DILocation(line: 60, column: 14, scope: !82)
!84 = !DILocation(line: 60, column: 9, scope: !75)
!85 = !DILocation(line: 60, column: 24, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !15, line: 60, column: 23)
!87 = !DILocalVariable(name: "dataCopy", scope: !88, file: !15, line: 62, type: !4)
!88 = distinct !DILexicalBlock(scope: !75, file: !15, line: 61, column: 5)
!89 = !DILocation(line: 62, column: 16, scope: !88)
!90 = !DILocation(line: 62, column: 27, scope: !88)
!91 = !DILocalVariable(name: "data", scope: !88, file: !15, line: 63, type: !4)
!92 = !DILocation(line: 63, column: 16, scope: !88)
!93 = !DILocation(line: 63, column: 23, scope: !88)
!94 = !DILocalVariable(name: "source", scope: !95, file: !15, line: 65, type: !38)
!95 = distinct !DILexicalBlock(scope: !88, file: !15, line: 64, column: 9)
!96 = !DILocation(line: 65, column: 18, scope: !95)
!97 = !DILocation(line: 68, column: 21, scope: !95)
!98 = !DILocation(line: 68, column: 27, scope: !95)
!99 = !DILocation(line: 68, column: 42, scope: !95)
!100 = !DILocation(line: 68, column: 35, scope: !95)
!101 = !DILocation(line: 68, column: 50, scope: !95)
!102 = !DILocation(line: 68, column: 13, scope: !95)
!103 = !DILocation(line: 69, column: 23, scope: !95)
!104 = !DILocation(line: 69, column: 13, scope: !95)
!105 = !DILocation(line: 70, column: 18, scope: !95)
!106 = !DILocation(line: 70, column: 13, scope: !95)
!107 = !DILocation(line: 73, column: 1, scope: !75)
