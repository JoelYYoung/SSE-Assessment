; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  store i8* null, i8** %data, align 8, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 50) #7, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !24
  %0 = load i8*, i8** %data, align 8, !dbg !25
  %cmp = icmp eq i8* %0, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %while.body
  %1 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  br label %while.end, !dbg !33

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  %2 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !44
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !44
  %3 = load i8*, i8** %data, align 8, !dbg !45
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !45
  store i8 0, i8* %arrayidx3, align 1, !dbg !46
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

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_16_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_16_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_16_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i8* null, i8** %data, align 8, !dbg !77
  br label %while.body, !dbg !78

while.body:                                       ; preds = %entry
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !79
  store i8* %call, i8** %data, align 8, !dbg !81
  %0 = load i8*, i8** %data, align 8, !dbg !82
  %cmp = icmp eq i8* %0, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #8, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %while.body
  %1 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  br label %while.end, !dbg !90

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !91, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !94
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !95
  store i8 0, i8* %arrayidx1, align 1, !dbg !96
  %2 = load i8*, i8** %data, align 8, !dbg !97
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !98
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %2, i8* align 16 %arraydecay2, i64 100, i1 false), !dbg !98
  %3 = load i8*, i8** %data, align 8, !dbg !99
  %arrayidx3 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !99
  store i8 0, i8* %arrayidx3, align 1, !dbg !100
  %4 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* %4), !dbg !102
  %5 = load i8*, i8** %data, align 8, !dbg !103
  call void @free(i8* %5) #7, !dbg !104
  ret void, !dbg !105
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_16_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_16.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 10, scope: !14)
!21 = !DILocation(line: 27, column: 5, scope: !14)
!22 = !DILocation(line: 30, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!24 = !DILocation(line: 30, column: 14, scope: !23)
!25 = !DILocation(line: 31, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !15, line: 31, column: 13)
!27 = !DILocation(line: 31, column: 18, scope: !26)
!28 = !DILocation(line: 31, column: 13, scope: !23)
!29 = !DILocation(line: 31, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 31, column: 27)
!31 = !DILocation(line: 32, column: 9, scope: !23)
!32 = !DILocation(line: 32, column: 17, scope: !23)
!33 = !DILocation(line: 33, column: 9, scope: !23)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 36, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 36, column: 14, scope: !35)
!40 = !DILocation(line: 37, column: 9, scope: !35)
!41 = !DILocation(line: 38, column: 9, scope: !35)
!42 = !DILocation(line: 38, column: 23, scope: !35)
!43 = !DILocation(line: 40, column: 17, scope: !35)
!44 = !DILocation(line: 40, column: 9, scope: !35)
!45 = !DILocation(line: 41, column: 9, scope: !35)
!46 = !DILocation(line: 41, column: 21, scope: !35)
!47 = !DILocation(line: 42, column: 19, scope: !35)
!48 = !DILocation(line: 42, column: 9, scope: !35)
!49 = !DILocation(line: 43, column: 14, scope: !35)
!50 = !DILocation(line: 43, column: 9, scope: !35)
!51 = !DILocation(line: 45, column: 1, scope: !14)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memmove_16_good", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocation(line: 78, column: 5, scope: !52)
!54 = !DILocation(line: 79, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !56, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !15, line: 91, type: !58)
!61 = !DILocation(line: 91, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !15, line: 91, type: !59)
!63 = !DILocation(line: 91, column: 27, scope: !55)
!64 = !DILocation(line: 94, column: 22, scope: !55)
!65 = !DILocation(line: 94, column: 12, scope: !55)
!66 = !DILocation(line: 94, column: 5, scope: !55)
!67 = !DILocation(line: 96, column: 5, scope: !55)
!68 = !DILocation(line: 97, column: 5, scope: !55)
!69 = !DILocation(line: 98, column: 5, scope: !55)
!70 = !DILocation(line: 101, column: 5, scope: !55)
!71 = !DILocation(line: 102, column: 5, scope: !55)
!72 = !DILocation(line: 103, column: 5, scope: !55)
!73 = !DILocation(line: 105, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !15, line: 54, type: !4)
!76 = !DILocation(line: 54, column: 12, scope: !74)
!77 = !DILocation(line: 55, column: 10, scope: !74)
!78 = !DILocation(line: 56, column: 5, scope: !74)
!79 = !DILocation(line: 59, column: 24, scope: !80)
!80 = distinct !DILexicalBlock(scope: !74, file: !15, line: 57, column: 5)
!81 = !DILocation(line: 59, column: 14, scope: !80)
!82 = !DILocation(line: 60, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !15, line: 60, column: 13)
!84 = !DILocation(line: 60, column: 18, scope: !83)
!85 = !DILocation(line: 60, column: 13, scope: !80)
!86 = !DILocation(line: 60, column: 28, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 60, column: 27)
!88 = !DILocation(line: 61, column: 9, scope: !80)
!89 = !DILocation(line: 61, column: 17, scope: !80)
!90 = !DILocation(line: 62, column: 9, scope: !80)
!91 = !DILocalVariable(name: "source", scope: !92, file: !15, line: 65, type: !36)
!92 = distinct !DILexicalBlock(scope: !74, file: !15, line: 64, column: 5)
!93 = !DILocation(line: 65, column: 14, scope: !92)
!94 = !DILocation(line: 66, column: 9, scope: !92)
!95 = !DILocation(line: 67, column: 9, scope: !92)
!96 = !DILocation(line: 67, column: 23, scope: !92)
!97 = !DILocation(line: 69, column: 17, scope: !92)
!98 = !DILocation(line: 69, column: 9, scope: !92)
!99 = !DILocation(line: 70, column: 9, scope: !92)
!100 = !DILocation(line: 70, column: 21, scope: !92)
!101 = !DILocation(line: 71, column: 19, scope: !92)
!102 = !DILocation(line: 71, column: 9, scope: !92)
!103 = !DILocation(line: 72, column: 14, scope: !92)
!104 = !DILocation(line: 72, column: 9, scope: !92)
!105 = !DILocation(line: 74, column: 1, scope: !74)
