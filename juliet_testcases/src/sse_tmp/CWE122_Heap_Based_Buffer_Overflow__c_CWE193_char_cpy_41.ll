; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !25
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !25
  %1 = load i8*, i8** %data.addr, align 8, !dbg !26
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !27
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay) #6, !dbg !28
  %2 = load i8*, i8** %data.addr, align 8, !dbg !29
  call void @printLine(i8* %2), !dbg !30
  %3 = load i8*, i8** %data.addr, align 8, !dbg !31
  call void @free(i8* %3) #6, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_bad() #0 !dbg !34 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !37, metadata !DIExpression()), !dbg !38
  store i8* null, i8** %data, align 8, !dbg !39
  %call = call noalias align 16 i8* @malloc(i64 10) #6, !dbg !40
  store i8* %call, i8** %data, align 8, !dbg !41
  %0 = load i8*, i8** %data, align 8, !dbg !42
  %cmp = icmp eq i8* %0, null, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !46
  unreachable, !dbg !46

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !48
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_badSink(i8* %1), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_goodG2BSink(i8* %data) #0 !dbg !51 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !54, metadata !DIExpression()), !dbg !56
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !56
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !56
  %1 = load i8*, i8** %data.addr, align 8, !dbg !57
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !58
  %call = call i8* @strcpy(i8* %1, i8* %arraydecay) #6, !dbg !59
  %2 = load i8*, i8** %data.addr, align 8, !dbg !60
  call void @printLine(i8* %2), !dbg !61
  %3 = load i8*, i8** %data.addr, align 8, !dbg !62
  call void @free(i8* %3) #6, !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #6, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #6, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !88, metadata !DIExpression()), !dbg !89
  store i8* null, i8** %data, align 8, !dbg !90
  %call = call noalias align 16 i8* @malloc(i64 11) #6, !dbg !91
  store i8* %call, i8** %data, align 8, !dbg !92
  %0 = load i8*, i8** %data, align 8, !dbg !93
  %cmp = icmp eq i8* %0, null, !dbg !95
  br i1 %cmp, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_goodG2BSink(i8* %1), !dbg !100
  ret void, !dbg !101
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_badSink", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 28, type: !4)
!19 = !DILocation(line: 28, column: 77, scope: !14)
!20 = !DILocalVariable(name: "source", scope: !21, file: !15, line: 31, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 11)
!25 = !DILocation(line: 31, column: 14, scope: !21)
!26 = !DILocation(line: 33, column: 16, scope: !21)
!27 = !DILocation(line: 33, column: 22, scope: !21)
!28 = !DILocation(line: 33, column: 9, scope: !21)
!29 = !DILocation(line: 34, column: 19, scope: !21)
!30 = !DILocation(line: 34, column: 9, scope: !21)
!31 = !DILocation(line: 35, column: 14, scope: !21)
!32 = !DILocation(line: 35, column: 9, scope: !21)
!33 = !DILocation(line: 37, column: 1, scope: !14)
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_bad", scope: !15, file: !15, line: 39, type: !35, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{null}
!37 = !DILocalVariable(name: "data", scope: !34, file: !15, line: 41, type: !4)
!38 = !DILocation(line: 41, column: 12, scope: !34)
!39 = !DILocation(line: 42, column: 10, scope: !34)
!40 = !DILocation(line: 44, column: 20, scope: !34)
!41 = !DILocation(line: 44, column: 10, scope: !34)
!42 = !DILocation(line: 45, column: 9, scope: !43)
!43 = distinct !DILexicalBlock(scope: !34, file: !15, line: 45, column: 9)
!44 = !DILocation(line: 45, column: 14, scope: !43)
!45 = !DILocation(line: 45, column: 9, scope: !34)
!46 = !DILocation(line: 45, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !15, line: 45, column: 23)
!48 = !DILocation(line: 46, column: 69, scope: !34)
!49 = !DILocation(line: 46, column: 5, scope: !34)
!50 = !DILocation(line: 47, column: 1, scope: !34)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_goodG2BSink", scope: !15, file: !15, line: 53, type: !16, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocalVariable(name: "data", arg: 1, scope: !51, file: !15, line: 53, type: !4)
!53 = !DILocation(line: 53, column: 81, scope: !51)
!54 = !DILocalVariable(name: "source", scope: !55, file: !15, line: 56, type: !22)
!55 = distinct !DILexicalBlock(scope: !51, file: !15, line: 55, column: 5)
!56 = !DILocation(line: 56, column: 14, scope: !55)
!57 = !DILocation(line: 58, column: 16, scope: !55)
!58 = !DILocation(line: 58, column: 22, scope: !55)
!59 = !DILocation(line: 58, column: 9, scope: !55)
!60 = !DILocation(line: 59, column: 19, scope: !55)
!61 = !DILocation(line: 59, column: 9, scope: !55)
!62 = !DILocation(line: 60, column: 14, scope: !55)
!63 = !DILocation(line: 60, column: 9, scope: !55)
!64 = !DILocation(line: 62, column: 1, scope: !51)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_41_good", scope: !15, file: !15, line: 75, type: !35, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocation(line: 77, column: 5, scope: !65)
!67 = !DILocation(line: 78, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 90, type: !69, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !71, !72}
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !15, line: 90, type: !71)
!74 = !DILocation(line: 90, column: 14, scope: !68)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !15, line: 90, type: !72)
!76 = !DILocation(line: 90, column: 27, scope: !68)
!77 = !DILocation(line: 93, column: 22, scope: !68)
!78 = !DILocation(line: 93, column: 12, scope: !68)
!79 = !DILocation(line: 93, column: 5, scope: !68)
!80 = !DILocation(line: 95, column: 5, scope: !68)
!81 = !DILocation(line: 96, column: 5, scope: !68)
!82 = !DILocation(line: 97, column: 5, scope: !68)
!83 = !DILocation(line: 100, column: 5, scope: !68)
!84 = !DILocation(line: 101, column: 5, scope: !68)
!85 = !DILocation(line: 102, column: 5, scope: !68)
!86 = !DILocation(line: 104, column: 5, scope: !68)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 65, type: !35, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !15, line: 67, type: !4)
!89 = !DILocation(line: 67, column: 12, scope: !87)
!90 = !DILocation(line: 68, column: 10, scope: !87)
!91 = !DILocation(line: 70, column: 20, scope: !87)
!92 = !DILocation(line: 70, column: 10, scope: !87)
!93 = !DILocation(line: 71, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !15, line: 71, column: 9)
!95 = !DILocation(line: 71, column: 14, scope: !94)
!96 = !DILocation(line: 71, column: 9, scope: !87)
!97 = !DILocation(line: 71, column: 24, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !15, line: 71, column: 23)
!99 = !DILocation(line: 72, column: 73, scope: !87)
!100 = !DILocation(line: 72, column: 5, scope: !87)
!101 = !DILocation(line: 73, column: 1, scope: !87)
