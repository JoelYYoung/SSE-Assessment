; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_01_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !37
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !38
  store i8 0, i8* %arrayidx1, align 1, !dbg !39
  %2 = load i8*, i8** %data, align 8, !dbg !40
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !41
  %3 = load i8*, i8** %data, align 8, !dbg !42
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !42
  store i8 0, i8* %arrayidx3, align 1, !dbg !43
  %4 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %4), !dbg !45
  %5 = load i8*, i8** %data, align 8, !dbg !46
  call void @free(i8* %5) #7, !dbg !47
  ret void, !dbg !48
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_01_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* null) #7, !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 %conv) #7, !dbg !63
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_01_good(), !dbg !65
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_01_bad(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !71 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !72, metadata !DIExpression()), !dbg !73
  store i8* null, i8** %data, align 8, !dbg !74
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !75
  store i8* %call, i8** %data, align 8, !dbg !76
  %0 = load i8*, i8** %data, align 8, !dbg !77
  %cmp = icmp eq i8* %0, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !88
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !89
  store i8 0, i8* %arrayidx1, align 1, !dbg !90
  %2 = load i8*, i8** %data, align 8, !dbg !91
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !92
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !92
  %3 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !93
  store i8 0, i8* %arrayidx3, align 1, !dbg !94
  %4 = load i8*, i8** %data, align 8, !dbg !95
  call void @printLine(i8* %4), !dbg !96
  %5 = load i8*, i8** %data, align 8, !dbg !97
  call void @free(i8* %5) #7, !dbg !98
  ret void, !dbg !99
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_01.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_01_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_01.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 28, column: 20, scope: !14)
!22 = !DILocation(line: 28, column: 10, scope: !14)
!23 = !DILocation(line: 29, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!25 = !DILocation(line: 29, column: 14, scope: !24)
!26 = !DILocation(line: 29, column: 9, scope: !14)
!27 = !DILocation(line: 29, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 29, column: 23)
!29 = !DILocation(line: 30, column: 5, scope: !14)
!30 = !DILocation(line: 30, column: 13, scope: !14)
!31 = !DILocalVariable(name: "source", scope: !32, file: !15, line: 32, type: !33)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 32, column: 14, scope: !32)
!37 = !DILocation(line: 33, column: 9, scope: !32)
!38 = !DILocation(line: 34, column: 9, scope: !32)
!39 = !DILocation(line: 34, column: 23, scope: !32)
!40 = !DILocation(line: 36, column: 16, scope: !32)
!41 = !DILocation(line: 36, column: 9, scope: !32)
!42 = !DILocation(line: 37, column: 9, scope: !32)
!43 = !DILocation(line: 37, column: 21, scope: !32)
!44 = !DILocation(line: 38, column: 19, scope: !32)
!45 = !DILocation(line: 38, column: 9, scope: !32)
!46 = !DILocation(line: 39, column: 14, scope: !32)
!47 = !DILocation(line: 39, column: 9, scope: !32)
!48 = !DILocation(line: 41, column: 1, scope: !14)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_01_good", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 70, column: 5, scope: !49)
!51 = !DILocation(line: 71, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 83, type: !53, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !15, line: 83, type: !55)
!58 = !DILocation(line: 83, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !15, line: 83, type: !56)
!60 = !DILocation(line: 83, column: 27, scope: !52)
!61 = !DILocation(line: 86, column: 22, scope: !52)
!62 = !DILocation(line: 86, column: 12, scope: !52)
!63 = !DILocation(line: 86, column: 5, scope: !52)
!64 = !DILocation(line: 88, column: 5, scope: !52)
!65 = !DILocation(line: 89, column: 5, scope: !52)
!66 = !DILocation(line: 90, column: 5, scope: !52)
!67 = !DILocation(line: 93, column: 5, scope: !52)
!68 = !DILocation(line: 94, column: 5, scope: !52)
!69 = !DILocation(line: 95, column: 5, scope: !52)
!70 = !DILocation(line: 97, column: 5, scope: !52)
!71 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 48, type: !16, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocalVariable(name: "data", scope: !71, file: !15, line: 50, type: !4)
!73 = !DILocation(line: 50, column: 12, scope: !71)
!74 = !DILocation(line: 51, column: 10, scope: !71)
!75 = !DILocation(line: 53, column: 20, scope: !71)
!76 = !DILocation(line: 53, column: 10, scope: !71)
!77 = !DILocation(line: 54, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !71, file: !15, line: 54, column: 9)
!79 = !DILocation(line: 54, column: 14, scope: !78)
!80 = !DILocation(line: 54, column: 9, scope: !71)
!81 = !DILocation(line: 54, column: 24, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !15, line: 54, column: 23)
!83 = !DILocation(line: 55, column: 5, scope: !71)
!84 = !DILocation(line: 55, column: 13, scope: !71)
!85 = !DILocalVariable(name: "source", scope: !86, file: !15, line: 57, type: !33)
!86 = distinct !DILexicalBlock(scope: !71, file: !15, line: 56, column: 5)
!87 = !DILocation(line: 57, column: 14, scope: !86)
!88 = !DILocation(line: 58, column: 9, scope: !86)
!89 = !DILocation(line: 59, column: 9, scope: !86)
!90 = !DILocation(line: 59, column: 23, scope: !86)
!91 = !DILocation(line: 61, column: 16, scope: !86)
!92 = !DILocation(line: 61, column: 9, scope: !86)
!93 = !DILocation(line: 62, column: 9, scope: !86)
!94 = !DILocation(line: 62, column: 21, scope: !86)
!95 = !DILocation(line: 63, column: 19, scope: !86)
!96 = !DILocation(line: 63, column: 9, scope: !86)
!97 = !DILocation(line: 64, column: 14, scope: !86)
!98 = !DILocation(line: 64, column: 9, scope: !86)
!99 = !DILocation(line: 66, column: 1, scope: !71)
