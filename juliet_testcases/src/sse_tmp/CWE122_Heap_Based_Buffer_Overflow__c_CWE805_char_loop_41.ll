; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41_badSink(i8* %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i64* %i, metadata !20, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !31
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  store i64 0, i64* %i, align 8, !dbg !34
  br label %for.cond, !dbg !36

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !37
  %cmp = icmp ult i64 %0, 100, !dbg !39
  br i1 %cmp, label %for.body, label %for.end, !dbg !40

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !41
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !43
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !43
  %3 = load i8*, i8** %data.addr, align 8, !dbg !44
  %4 = load i64, i64* %i, align 8, !dbg !45
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !44
  store i8 %2, i8* %arrayidx2, align 1, !dbg !46
  br label %for.inc, !dbg !47

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !48
  %inc = add i64 %5, 1, !dbg !48
  store i64 %inc, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !49, !llvm.loop !50

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !53
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !53
  store i8 0, i8* %arrayidx3, align 1, !dbg !54
  %7 = load i8*, i8** %data.addr, align 8, !dbg !55
  call void @printLine(i8* %7), !dbg !56
  %8 = load i8*, i8** %data.addr, align 8, !dbg !57
  call void @free(i8* %8) #6, !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41_bad() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  store i8* null, i8** %data, align 8, !dbg !65
  %call = call noalias align 16 i8* @malloc(i64 50) #6, !dbg !66
  store i8* %call, i8** %data, align 8, !dbg !67
  %0 = load i8*, i8** %data, align 8, !dbg !68
  %cmp = icmp eq i8* %0, null, !dbg !70
  br i1 %cmp, label %if.then, label %if.end, !dbg !71

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !72
  unreachable, !dbg !72

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  %2 = load i8*, i8** %data, align 8, !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41_badSink(i8* %2), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41_goodG2BSink(i8* %data) #0 !dbg !79 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i64* %i, metadata !82, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !87
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  store i64 0, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !93
  %cmp = icmp ult i64 %0, 100, !dbg !95
  br i1 %cmp, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !99
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !99
  %3 = load i8*, i8** %data.addr, align 8, !dbg !100
  %4 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !100
  store i8 %2, i8* %arrayidx2, align 1, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !104
  %inc = add i64 %5, 1, !dbg !104
  store i64 %inc, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !108
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !108
  store i8 0, i8* %arrayidx3, align 1, !dbg !109
  %7 = load i8*, i8** %data.addr, align 8, !dbg !110
  call void @printLine(i8* %7), !dbg !111
  %8 = load i8*, i8** %data.addr, align 8, !dbg !112
  call void @free(i8* %8) #6, !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41_good() #0 !dbg !115 {
entry:
  call void @goodG2B(), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !118 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !123, metadata !DIExpression()), !dbg !124
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !125, metadata !DIExpression()), !dbg !126
  %call = call i64 @time(i64* null) #6, !dbg !127
  %conv = trunc i64 %call to i32, !dbg !128
  call void @srand(i32 %conv) #6, !dbg !129
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !130
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41_good(), !dbg !131
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !132
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !133
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41_bad(), !dbg !134
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !135
  ret i32 0, !dbg !136
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !137 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !138, metadata !DIExpression()), !dbg !139
  store i8* null, i8** %data, align 8, !dbg !140
  %call = call noalias align 16 i8* @malloc(i64 100) #6, !dbg !141
  store i8* %call, i8** %data, align 8, !dbg !142
  %0 = load i8*, i8** %data, align 8, !dbg !143
  %cmp = icmp eq i8* %0, null, !dbg !145
  br i1 %cmp, label %if.then, label %if.end, !dbg !146

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !147
  unreachable, !dbg !147

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !149
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !149
  store i8 0, i8* %arrayidx, align 1, !dbg !150
  %2 = load i8*, i8** %data, align 8, !dbg !151
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41_goodG2BSink(i8* %2), !dbg !152
  ret void, !dbg !153
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41.c", directory: "/home/joelyang/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !4}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !4)
!19 = !DILocation(line: 23, column: 78, scope: !14)
!20 = !DILocalVariable(name: "i", scope: !21, file: !15, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !23, line: 46, baseType: !24)
!23 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!24 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!25 = !DILocation(line: 26, column: 16, scope: !21)
!26 = !DILocalVariable(name: "source", scope: !21, file: !15, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 14, scope: !21)
!31 = !DILocation(line: 28, column: 9, scope: !21)
!32 = !DILocation(line: 29, column: 9, scope: !21)
!33 = !DILocation(line: 29, column: 23, scope: !21)
!34 = !DILocation(line: 31, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !21, file: !15, line: 31, column: 9)
!36 = !DILocation(line: 31, column: 14, scope: !35)
!37 = !DILocation(line: 31, column: 21, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !15, line: 31, column: 9)
!39 = !DILocation(line: 31, column: 23, scope: !38)
!40 = !DILocation(line: 31, column: 9, scope: !35)
!41 = !DILocation(line: 33, column: 30, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 32, column: 9)
!43 = !DILocation(line: 33, column: 23, scope: !42)
!44 = !DILocation(line: 33, column: 13, scope: !42)
!45 = !DILocation(line: 33, column: 18, scope: !42)
!46 = !DILocation(line: 33, column: 21, scope: !42)
!47 = !DILocation(line: 34, column: 9, scope: !42)
!48 = !DILocation(line: 31, column: 31, scope: !38)
!49 = !DILocation(line: 31, column: 9, scope: !38)
!50 = distinct !{!50, !40, !51, !52}
!51 = !DILocation(line: 34, column: 9, scope: !35)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 35, column: 9, scope: !21)
!54 = !DILocation(line: 35, column: 21, scope: !21)
!55 = !DILocation(line: 36, column: 19, scope: !21)
!56 = !DILocation(line: 36, column: 9, scope: !21)
!57 = !DILocation(line: 37, column: 14, scope: !21)
!58 = !DILocation(line: 37, column: 9, scope: !21)
!59 = !DILocation(line: 39, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41_bad", scope: !15, file: !15, line: 41, type: !61, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DISubroutineType(types: !62)
!62 = !{null}
!63 = !DILocalVariable(name: "data", scope: !60, file: !15, line: 43, type: !4)
!64 = !DILocation(line: 43, column: 12, scope: !60)
!65 = !DILocation(line: 44, column: 10, scope: !60)
!66 = !DILocation(line: 46, column: 20, scope: !60)
!67 = !DILocation(line: 46, column: 10, scope: !60)
!68 = !DILocation(line: 47, column: 9, scope: !69)
!69 = distinct !DILexicalBlock(scope: !60, file: !15, line: 47, column: 9)
!70 = !DILocation(line: 47, column: 14, scope: !69)
!71 = !DILocation(line: 47, column: 9, scope: !60)
!72 = !DILocation(line: 47, column: 24, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !15, line: 47, column: 23)
!74 = !DILocation(line: 48, column: 5, scope: !60)
!75 = !DILocation(line: 48, column: 13, scope: !60)
!76 = !DILocation(line: 49, column: 70, scope: !60)
!77 = !DILocation(line: 49, column: 5, scope: !60)
!78 = !DILocation(line: 50, column: 1, scope: !60)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41_goodG2BSink", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: "data", arg: 1, scope: !79, file: !15, line: 56, type: !4)
!81 = !DILocation(line: 56, column: 82, scope: !79)
!82 = !DILocalVariable(name: "i", scope: !83, file: !15, line: 59, type: !22)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 58, column: 5)
!84 = !DILocation(line: 59, column: 16, scope: !83)
!85 = !DILocalVariable(name: "source", scope: !83, file: !15, line: 60, type: !27)
!86 = !DILocation(line: 60, column: 14, scope: !83)
!87 = !DILocation(line: 61, column: 9, scope: !83)
!88 = !DILocation(line: 62, column: 9, scope: !83)
!89 = !DILocation(line: 62, column: 23, scope: !83)
!90 = !DILocation(line: 64, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !83, file: !15, line: 64, column: 9)
!92 = !DILocation(line: 64, column: 14, scope: !91)
!93 = !DILocation(line: 64, column: 21, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !15, line: 64, column: 9)
!95 = !DILocation(line: 64, column: 23, scope: !94)
!96 = !DILocation(line: 64, column: 9, scope: !91)
!97 = !DILocation(line: 66, column: 30, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !15, line: 65, column: 9)
!99 = !DILocation(line: 66, column: 23, scope: !98)
!100 = !DILocation(line: 66, column: 13, scope: !98)
!101 = !DILocation(line: 66, column: 18, scope: !98)
!102 = !DILocation(line: 66, column: 21, scope: !98)
!103 = !DILocation(line: 67, column: 9, scope: !98)
!104 = !DILocation(line: 64, column: 31, scope: !94)
!105 = !DILocation(line: 64, column: 9, scope: !94)
!106 = distinct !{!106, !96, !107, !52}
!107 = !DILocation(line: 67, column: 9, scope: !91)
!108 = !DILocation(line: 68, column: 9, scope: !83)
!109 = !DILocation(line: 68, column: 21, scope: !83)
!110 = !DILocation(line: 69, column: 19, scope: !83)
!111 = !DILocation(line: 69, column: 9, scope: !83)
!112 = !DILocation(line: 70, column: 14, scope: !83)
!113 = !DILocation(line: 70, column: 9, scope: !83)
!114 = !DILocation(line: 72, column: 1, scope: !79)
!115 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_41_good", scope: !15, file: !15, line: 86, type: !61, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocation(line: 88, column: 5, scope: !115)
!117 = !DILocation(line: 89, column: 1, scope: !115)
!118 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 101, type: !119, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!119 = !DISubroutineType(types: !120)
!120 = !{!121, !121, !122}
!121 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!123 = !DILocalVariable(name: "argc", arg: 1, scope: !118, file: !15, line: 101, type: !121)
!124 = !DILocation(line: 101, column: 14, scope: !118)
!125 = !DILocalVariable(name: "argv", arg: 2, scope: !118, file: !15, line: 101, type: !122)
!126 = !DILocation(line: 101, column: 27, scope: !118)
!127 = !DILocation(line: 104, column: 22, scope: !118)
!128 = !DILocation(line: 104, column: 12, scope: !118)
!129 = !DILocation(line: 104, column: 5, scope: !118)
!130 = !DILocation(line: 106, column: 5, scope: !118)
!131 = !DILocation(line: 107, column: 5, scope: !118)
!132 = !DILocation(line: 108, column: 5, scope: !118)
!133 = !DILocation(line: 111, column: 5, scope: !118)
!134 = !DILocation(line: 112, column: 5, scope: !118)
!135 = !DILocation(line: 113, column: 5, scope: !118)
!136 = !DILocation(line: 115, column: 5, scope: !118)
!137 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 75, type: !61, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DILocalVariable(name: "data", scope: !137, file: !15, line: 77, type: !4)
!139 = !DILocation(line: 77, column: 12, scope: !137)
!140 = !DILocation(line: 78, column: 10, scope: !137)
!141 = !DILocation(line: 80, column: 20, scope: !137)
!142 = !DILocation(line: 80, column: 10, scope: !137)
!143 = !DILocation(line: 81, column: 9, scope: !144)
!144 = distinct !DILexicalBlock(scope: !137, file: !15, line: 81, column: 9)
!145 = !DILocation(line: 81, column: 14, scope: !144)
!146 = !DILocation(line: 81, column: 9, scope: !137)
!147 = !DILocation(line: 81, column: 24, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !15, line: 81, column: 23)
!149 = !DILocation(line: 82, column: 5, scope: !137)
!150 = !DILocation(line: 82, column: 13, scope: !137)
!151 = !DILocation(line: 83, column: 74, scope: !137)
!152 = !DILocation(line: 83, column: 5, scope: !137)
!153 = !DILocation(line: 84, column: 1, scope: !137)
