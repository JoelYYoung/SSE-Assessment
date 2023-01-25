; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  %2 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !37
  call void %2(i8* %3), !dbg !36
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !48, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !53
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx, align 1, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !59
  %cmp = icmp ult i64 %0, 100, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !65
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !65
  %3 = load i8*, i8** %data.addr, align 8, !dbg !66
  %4 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !66
  store i8 %2, i8* %arrayidx2, align 1, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %5, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !75
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !75
  store i8 0, i8* %arrayidx3, align 1, !dbg !76
  %7 = load i8*, i8** %data.addr, align 8, !dbg !77
  call void @printLine(i8* %7), !dbg !78
  %8 = load i8*, i8** %data.addr, align 8, !dbg !79
  call void @free(i8* %8) #6, !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_44_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* null) #6, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #6, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_44_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_44_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !107, metadata !DIExpression()), !dbg !108
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !108
  store i8* null, i8** %data, align 8, !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !110
  store i8* %call, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %cmp = icmp eq i8* %0, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %2 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !120
  %3 = load i8*, i8** %data, align 8, !dbg !121
  call void %2(i8* %3), !dbg !120
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !123 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !129, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !131
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !132
  store i8 0, i8* %arrayidx, align 1, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !137
  %cmp = icmp ult i64 %0, 100, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !143
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !143
  %3 = load i8*, i8** %data.addr, align 8, !dbg !144
  %4 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !144
  store i8 %2, i8* %arrayidx2, align 1, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %5, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !152
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !152
  store i8 0, i8* %arrayidx3, align 1, !dbg !153
  %7 = load i8*, i8** %data.addr, align 8, !dbg !154
  call void @printLine(i8* %7), !dbg !155
  %8 = load i8*, i8** %data.addr, align 8, !dbg !156
  call void @free(i8* %8) #6, !dbg !157
  ret void, !dbg !158
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_44_bad", scope: !15, file: !15, line: 41, type: !16, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_44.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 43, type: !4)
!19 = !DILocation(line: 43, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 45, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 45, column: 12, scope: !14)
!25 = !DILocation(line: 46, column: 10, scope: !14)
!26 = !DILocation(line: 48, column: 20, scope: !14)
!27 = !DILocation(line: 48, column: 10, scope: !14)
!28 = !DILocation(line: 49, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 49, column: 9)
!30 = !DILocation(line: 49, column: 14, scope: !29)
!31 = !DILocation(line: 49, column: 9, scope: !14)
!32 = !DILocation(line: 49, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 49, column: 23)
!34 = !DILocation(line: 50, column: 5, scope: !14)
!35 = !DILocation(line: 50, column: 13, scope: !14)
!36 = !DILocation(line: 52, column: 5, scope: !14)
!37 = !DILocation(line: 52, column: 13, scope: !14)
!38 = !DILocation(line: 53, column: 1, scope: !14)
!39 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !15, line: 23, type: !4)
!41 = !DILocation(line: 23, column: 28, scope: !39)
!42 = !DILocalVariable(name: "i", scope: !43, file: !15, line: 26, type: !44)
!43 = distinct !DILexicalBlock(scope: !39, file: !15, line: 25, column: 5)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 26, column: 16, scope: !43)
!48 = !DILocalVariable(name: "source", scope: !43, file: !15, line: 27, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 27, column: 14, scope: !43)
!53 = !DILocation(line: 28, column: 9, scope: !43)
!54 = !DILocation(line: 29, column: 9, scope: !43)
!55 = !DILocation(line: 29, column: 23, scope: !43)
!56 = !DILocation(line: 31, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !43, file: !15, line: 31, column: 9)
!58 = !DILocation(line: 31, column: 14, scope: !57)
!59 = !DILocation(line: 31, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !15, line: 31, column: 9)
!61 = !DILocation(line: 31, column: 23, scope: !60)
!62 = !DILocation(line: 31, column: 9, scope: !57)
!63 = !DILocation(line: 33, column: 30, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !15, line: 32, column: 9)
!65 = !DILocation(line: 33, column: 23, scope: !64)
!66 = !DILocation(line: 33, column: 13, scope: !64)
!67 = !DILocation(line: 33, column: 18, scope: !64)
!68 = !DILocation(line: 33, column: 21, scope: !64)
!69 = !DILocation(line: 34, column: 9, scope: !64)
!70 = !DILocation(line: 31, column: 31, scope: !60)
!71 = !DILocation(line: 31, column: 9, scope: !60)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 34, column: 9, scope: !57)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 35, column: 9, scope: !43)
!76 = !DILocation(line: 35, column: 21, scope: !43)
!77 = !DILocation(line: 36, column: 19, scope: !43)
!78 = !DILocation(line: 36, column: 9, scope: !43)
!79 = !DILocation(line: 37, column: 14, scope: !43)
!80 = !DILocation(line: 37, column: 9, scope: !43)
!81 = !DILocation(line: 39, column: 1, scope: !39)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_44_good", scope: !15, file: !15, line: 90, type: !16, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 92, column: 5, scope: !82)
!84 = !DILocation(line: 93, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 104, type: !86, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !88, !89}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !15, line: 104, type: !88)
!91 = !DILocation(line: 104, column: 14, scope: !85)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !15, line: 104, type: !89)
!93 = !DILocation(line: 104, column: 27, scope: !85)
!94 = !DILocation(line: 107, column: 22, scope: !85)
!95 = !DILocation(line: 107, column: 12, scope: !85)
!96 = !DILocation(line: 107, column: 5, scope: !85)
!97 = !DILocation(line: 109, column: 5, scope: !85)
!98 = !DILocation(line: 110, column: 5, scope: !85)
!99 = !DILocation(line: 111, column: 5, scope: !85)
!100 = !DILocation(line: 114, column: 5, scope: !85)
!101 = !DILocation(line: 115, column: 5, scope: !85)
!102 = !DILocation(line: 116, column: 5, scope: !85)
!103 = !DILocation(line: 118, column: 5, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 78, type: !16, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !15, line: 80, type: !4)
!106 = !DILocation(line: 80, column: 12, scope: !104)
!107 = !DILocalVariable(name: "funcPtr", scope: !104, file: !15, line: 81, type: !21)
!108 = !DILocation(line: 81, column: 12, scope: !104)
!109 = !DILocation(line: 82, column: 10, scope: !104)
!110 = !DILocation(line: 84, column: 20, scope: !104)
!111 = !DILocation(line: 84, column: 10, scope: !104)
!112 = !DILocation(line: 85, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !104, file: !15, line: 85, column: 9)
!114 = !DILocation(line: 85, column: 14, scope: !113)
!115 = !DILocation(line: 85, column: 9, scope: !104)
!116 = !DILocation(line: 85, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 85, column: 23)
!118 = !DILocation(line: 86, column: 5, scope: !104)
!119 = !DILocation(line: 86, column: 13, scope: !104)
!120 = !DILocation(line: 87, column: 5, scope: !104)
!121 = !DILocation(line: 87, column: 13, scope: !104)
!122 = !DILocation(line: 88, column: 1, scope: !104)
!123 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 60, type: !22, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocalVariable(name: "data", arg: 1, scope: !123, file: !15, line: 60, type: !4)
!125 = !DILocation(line: 60, column: 32, scope: !123)
!126 = !DILocalVariable(name: "i", scope: !127, file: !15, line: 63, type: !44)
!127 = distinct !DILexicalBlock(scope: !123, file: !15, line: 62, column: 5)
!128 = !DILocation(line: 63, column: 16, scope: !127)
!129 = !DILocalVariable(name: "source", scope: !127, file: !15, line: 64, type: !49)
!130 = !DILocation(line: 64, column: 14, scope: !127)
!131 = !DILocation(line: 65, column: 9, scope: !127)
!132 = !DILocation(line: 66, column: 9, scope: !127)
!133 = !DILocation(line: 66, column: 23, scope: !127)
!134 = !DILocation(line: 68, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !127, file: !15, line: 68, column: 9)
!136 = !DILocation(line: 68, column: 14, scope: !135)
!137 = !DILocation(line: 68, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !15, line: 68, column: 9)
!139 = !DILocation(line: 68, column: 23, scope: !138)
!140 = !DILocation(line: 68, column: 9, scope: !135)
!141 = !DILocation(line: 70, column: 30, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !15, line: 69, column: 9)
!143 = !DILocation(line: 70, column: 23, scope: !142)
!144 = !DILocation(line: 70, column: 13, scope: !142)
!145 = !DILocation(line: 70, column: 18, scope: !142)
!146 = !DILocation(line: 70, column: 21, scope: !142)
!147 = !DILocation(line: 71, column: 9, scope: !142)
!148 = !DILocation(line: 68, column: 31, scope: !138)
!149 = !DILocation(line: 68, column: 9, scope: !138)
!150 = distinct !{!150, !140, !151, !74}
!151 = !DILocation(line: 71, column: 9, scope: !135)
!152 = !DILocation(line: 72, column: 9, scope: !127)
!153 = !DILocation(line: 72, column: 21, scope: !127)
!154 = !DILocation(line: 73, column: 19, scope: !127)
!155 = !DILocation(line: 73, column: 9, scope: !127)
!156 = !DILocation(line: 74, column: 14, scope: !127)
!157 = !DILocation(line: 74, column: 9, scope: !127)
!158 = !DILocation(line: 76, column: 1, scope: !123)
