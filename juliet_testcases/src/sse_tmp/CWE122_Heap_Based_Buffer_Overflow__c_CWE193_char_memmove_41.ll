; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !25
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !25
  %1 = load i8*, i8** %data.addr, align 8, !dbg !26
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !27
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !28
  %call = call i64 @strlen(i8* %arraydecay1) #7, !dbg !29
  %add = add i64 %call, 1, !dbg !30
  %mul = mul i64 %add, 1, !dbg !31
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !27
  %2 = load i8*, i8** %data.addr, align 8, !dbg !32
  call void @printLine(i8* %2), !dbg !33
  %3 = load i8*, i8** %data.addr, align 8, !dbg !34
  call void @free(i8* %3) #8, !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_bad() #0 !dbg !37 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !40, metadata !DIExpression()), !dbg !41
  store i8* null, i8** %data, align 8, !dbg !42
  %call = call noalias align 16 i8* @malloc(i64 10) #8, !dbg !43
  store i8* %call, i8** %data, align 8, !dbg !44
  %0 = load i8*, i8** %data, align 8, !dbg !45
  %cmp = icmp eq i8* %0, null, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !49
  unreachable, !dbg !49

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !51
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_badSink(i8* %1), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_goodG2BSink(i8* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !57, metadata !DIExpression()), !dbg !59
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !59
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !59
  %1 = load i8*, i8** %data.addr, align 8, !dbg !60
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !61
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !62
  %call = call i64 @strlen(i8* %arraydecay1) #7, !dbg !63
  %add = add i64 %call, 1, !dbg !64
  %mul = mul i64 %add, 1, !dbg !65
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %arraydecay, i64 %mul, i1 false), !dbg !61
  %2 = load i8*, i8** %data.addr, align 8, !dbg !66
  call void @printLine(i8* %2), !dbg !67
  %3 = load i8*, i8** %data.addr, align 8, !dbg !68
  call void @free(i8* %3) #8, !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #8, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #8, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  store i8* null, i8** %data, align 8, !dbg !96
  %call = call noalias align 16 i8* @malloc(i64 11) #8, !dbg !97
  store i8* %call, i8** %data, align 8, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !99
  %cmp = icmp eq i8* %0, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_goodG2BSink(i8* %1), !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_badSink", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 28, type: !4)
!19 = !DILocation(line: 28, column: 81, scope: !14)
!20 = !DILocalVariable(name: "source", scope: !21, file: !15, line: 31, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 11)
!25 = !DILocation(line: 31, column: 14, scope: !21)
!26 = !DILocation(line: 34, column: 17, scope: !21)
!27 = !DILocation(line: 34, column: 9, scope: !21)
!28 = !DILocation(line: 34, column: 39, scope: !21)
!29 = !DILocation(line: 34, column: 32, scope: !21)
!30 = !DILocation(line: 34, column: 47, scope: !21)
!31 = !DILocation(line: 34, column: 52, scope: !21)
!32 = !DILocation(line: 35, column: 19, scope: !21)
!33 = !DILocation(line: 35, column: 9, scope: !21)
!34 = !DILocation(line: 36, column: 14, scope: !21)
!35 = !DILocation(line: 36, column: 9, scope: !21)
!36 = !DILocation(line: 38, column: 1, scope: !14)
!37 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_bad", scope: !15, file: !15, line: 40, type: !38, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DISubroutineType(types: !39)
!39 = !{null}
!40 = !DILocalVariable(name: "data", scope: !37, file: !15, line: 42, type: !4)
!41 = !DILocation(line: 42, column: 12, scope: !37)
!42 = !DILocation(line: 43, column: 10, scope: !37)
!43 = !DILocation(line: 45, column: 20, scope: !37)
!44 = !DILocation(line: 45, column: 10, scope: !37)
!45 = !DILocation(line: 46, column: 9, scope: !46)
!46 = distinct !DILexicalBlock(scope: !37, file: !15, line: 46, column: 9)
!47 = !DILocation(line: 46, column: 14, scope: !46)
!48 = !DILocation(line: 46, column: 9, scope: !37)
!49 = !DILocation(line: 46, column: 24, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !15, line: 46, column: 23)
!51 = !DILocation(line: 47, column: 73, scope: !37)
!52 = !DILocation(line: 47, column: 5, scope: !37)
!53 = !DILocation(line: 48, column: 1, scope: !37)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_goodG2BSink", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !15, line: 54, type: !4)
!56 = !DILocation(line: 54, column: 85, scope: !54)
!57 = !DILocalVariable(name: "source", scope: !58, file: !15, line: 57, type: !22)
!58 = distinct !DILexicalBlock(scope: !54, file: !15, line: 56, column: 5)
!59 = !DILocation(line: 57, column: 14, scope: !58)
!60 = !DILocation(line: 60, column: 17, scope: !58)
!61 = !DILocation(line: 60, column: 9, scope: !58)
!62 = !DILocation(line: 60, column: 39, scope: !58)
!63 = !DILocation(line: 60, column: 32, scope: !58)
!64 = !DILocation(line: 60, column: 47, scope: !58)
!65 = !DILocation(line: 60, column: 52, scope: !58)
!66 = !DILocation(line: 61, column: 19, scope: !58)
!67 = !DILocation(line: 61, column: 9, scope: !58)
!68 = !DILocation(line: 62, column: 14, scope: !58)
!69 = !DILocation(line: 62, column: 9, scope: !58)
!70 = !DILocation(line: 64, column: 1, scope: !54)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_41_good", scope: !15, file: !15, line: 77, type: !38, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 79, column: 5, scope: !71)
!73 = !DILocation(line: 80, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 92, type: !75, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !77, !78}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !15, line: 92, type: !77)
!80 = !DILocation(line: 92, column: 14, scope: !74)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !15, line: 92, type: !78)
!82 = !DILocation(line: 92, column: 27, scope: !74)
!83 = !DILocation(line: 95, column: 22, scope: !74)
!84 = !DILocation(line: 95, column: 12, scope: !74)
!85 = !DILocation(line: 95, column: 5, scope: !74)
!86 = !DILocation(line: 97, column: 5, scope: !74)
!87 = !DILocation(line: 98, column: 5, scope: !74)
!88 = !DILocation(line: 99, column: 5, scope: !74)
!89 = !DILocation(line: 102, column: 5, scope: !74)
!90 = !DILocation(line: 103, column: 5, scope: !74)
!91 = !DILocation(line: 104, column: 5, scope: !74)
!92 = !DILocation(line: 106, column: 5, scope: !74)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 67, type: !38, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !15, line: 69, type: !4)
!95 = !DILocation(line: 69, column: 12, scope: !93)
!96 = !DILocation(line: 70, column: 10, scope: !93)
!97 = !DILocation(line: 72, column: 20, scope: !93)
!98 = !DILocation(line: 72, column: 10, scope: !93)
!99 = !DILocation(line: 73, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !93, file: !15, line: 73, column: 9)
!101 = !DILocation(line: 73, column: 14, scope: !100)
!102 = !DILocation(line: 73, column: 9, scope: !93)
!103 = !DILocation(line: 73, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 73, column: 23)
!105 = !DILocation(line: 74, column: 77, scope: !93)
!106 = !DILocation(line: 74, column: 5, scope: !93)
!107 = !DILocation(line: 75, column: 1, scope: !93)
