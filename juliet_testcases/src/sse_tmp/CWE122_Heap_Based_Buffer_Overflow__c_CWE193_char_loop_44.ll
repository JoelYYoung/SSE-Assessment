; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_44.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
  store i8* null, i8** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 10) #7, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  call void %1(i8* %2), !dbg !34
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal void @badSink(i8* %data) #0 !dbg !37 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !53
  %call = call i64 @strlen(i8* %arraydecay) #9, !dbg !54
  store i64 %call, i64* %sourceLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !59
  %2 = load i64, i64* %sourceLen, align 8, !dbg !61
  %add = add i64 %2, 1, !dbg !62
  %cmp = icmp ult i64 %1, %add, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !67
  %4 = load i8, i8* %arrayidx, align 1, !dbg !67
  %5 = load i8*, i8** %data.addr, align 8, !dbg !68
  %6 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !68
  store i8 %4, i8* %arrayidx1, align 1, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %7, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !77
  call void @printLine(i8* %8), !dbg !78
  %9 = load i8*, i8** %data.addr, align 8, !dbg !79
  call void @free(i8* %9) #7, !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_44_good() #0 !dbg !82 {
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
  %call = call i64 @time(i64* null) #7, !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 %conv) #7, !dbg !96
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_44_good(), !dbg !98
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_44_bad(), !dbg !101
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #6

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
  %call = call noalias align 16 i8* @malloc(i64 11) #7, !dbg !110
  store i8* %call, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %cmp = icmp eq i8* %0, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %1 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !118
  %2 = load i8*, i8** %data, align 8, !dbg !119
  call void %1(i8* %2), !dbg !118
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2BSink(i8* %data) #0 !dbg !121 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !129, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !131
  %call = call i64 @strlen(i8* %arraydecay) #9, !dbg !132
  store i64 %call, i64* %sourceLen, align 8, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !137
  %2 = load i64, i64* %sourceLen, align 8, !dbg !139
  %add = add i64 %2, 1, !dbg !140
  %cmp = icmp ult i64 %1, %add, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !145
  %4 = load i8, i8* %arrayidx, align 1, !dbg !145
  %5 = load i8*, i8** %data.addr, align 8, !dbg !146
  %6 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !146
  store i8 %4, i8* %arrayidx1, align 1, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %7, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !154
  call void @printLine(i8* %8), !dbg !155
  %9 = load i8*, i8** %data.addr, align 8, !dbg !156
  call void @free(i8* %9) #7, !dbg !157
  ret void, !dbg !158
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_44.c", directory: "/root/SSE-Assessment")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_44_bad", scope: !15, file: !15, line: 45, type: !16, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_44.c", directory: "/root/SSE-Assessment")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 47, type: !4)
!19 = !DILocation(line: 47, column: 12, scope: !14)
!20 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 49, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !4}
!24 = !DILocation(line: 49, column: 12, scope: !14)
!25 = !DILocation(line: 50, column: 10, scope: !14)
!26 = !DILocation(line: 52, column: 20, scope: !14)
!27 = !DILocation(line: 52, column: 10, scope: !14)
!28 = !DILocation(line: 53, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 53, column: 9)
!30 = !DILocation(line: 53, column: 14, scope: !29)
!31 = !DILocation(line: 53, column: 9, scope: !14)
!32 = !DILocation(line: 53, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 53, column: 23)
!34 = !DILocation(line: 55, column: 5, scope: !14)
!35 = !DILocation(line: 55, column: 13, scope: !14)
!36 = !DILocation(line: 56, column: 1, scope: !14)
!37 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 28, type: !22, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!38 = !DILocalVariable(name: "data", arg: 1, scope: !37, file: !15, line: 28, type: !4)
!39 = !DILocation(line: 28, column: 28, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !15, line: 31, type: !42)
!41 = distinct !DILexicalBlock(scope: !37, file: !15, line: 30, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 88, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 11)
!45 = !DILocation(line: 31, column: 14, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !15, line: 32, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 46, baseType: !49)
!48 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!49 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 32, column: 16, scope: !41)
!51 = !DILocalVariable(name: "sourceLen", scope: !41, file: !15, line: 32, type: !47)
!52 = !DILocation(line: 32, column: 19, scope: !41)
!53 = !DILocation(line: 33, column: 28, scope: !41)
!54 = !DILocation(line: 33, column: 21, scope: !41)
!55 = !DILocation(line: 33, column: 19, scope: !41)
!56 = !DILocation(line: 36, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !41, file: !15, line: 36, column: 9)
!58 = !DILocation(line: 36, column: 14, scope: !57)
!59 = !DILocation(line: 36, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !15, line: 36, column: 9)
!61 = !DILocation(line: 36, column: 25, scope: !60)
!62 = !DILocation(line: 36, column: 35, scope: !60)
!63 = !DILocation(line: 36, column: 23, scope: !60)
!64 = !DILocation(line: 36, column: 9, scope: !57)
!65 = !DILocation(line: 38, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !15, line: 37, column: 9)
!67 = !DILocation(line: 38, column: 23, scope: !66)
!68 = !DILocation(line: 38, column: 13, scope: !66)
!69 = !DILocation(line: 38, column: 18, scope: !66)
!70 = !DILocation(line: 38, column: 21, scope: !66)
!71 = !DILocation(line: 39, column: 9, scope: !66)
!72 = !DILocation(line: 36, column: 41, scope: !60)
!73 = !DILocation(line: 36, column: 9, scope: !60)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 39, column: 9, scope: !57)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 40, column: 19, scope: !41)
!78 = !DILocation(line: 40, column: 9, scope: !41)
!79 = !DILocation(line: 41, column: 14, scope: !41)
!80 = !DILocation(line: 41, column: 9, scope: !41)
!81 = !DILocation(line: 43, column: 1, scope: !37)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_44_good", scope: !15, file: !15, line: 91, type: !16, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 93, column: 5, scope: !82)
!84 = !DILocation(line: 94, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 105, type: !86, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !88, !89}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !15, line: 105, type: !88)
!91 = !DILocation(line: 105, column: 14, scope: !85)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !15, line: 105, type: !89)
!93 = !DILocation(line: 105, column: 27, scope: !85)
!94 = !DILocation(line: 108, column: 22, scope: !85)
!95 = !DILocation(line: 108, column: 12, scope: !85)
!96 = !DILocation(line: 108, column: 5, scope: !85)
!97 = !DILocation(line: 110, column: 5, scope: !85)
!98 = !DILocation(line: 111, column: 5, scope: !85)
!99 = !DILocation(line: 112, column: 5, scope: !85)
!100 = !DILocation(line: 115, column: 5, scope: !85)
!101 = !DILocation(line: 116, column: 5, scope: !85)
!102 = !DILocation(line: 117, column: 5, scope: !85)
!103 = !DILocation(line: 119, column: 5, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DILocalVariable(name: "data", scope: !104, file: !15, line: 82, type: !4)
!106 = !DILocation(line: 82, column: 12, scope: !104)
!107 = !DILocalVariable(name: "funcPtr", scope: !104, file: !15, line: 83, type: !21)
!108 = !DILocation(line: 83, column: 12, scope: !104)
!109 = !DILocation(line: 84, column: 10, scope: !104)
!110 = !DILocation(line: 86, column: 20, scope: !104)
!111 = !DILocation(line: 86, column: 10, scope: !104)
!112 = !DILocation(line: 87, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !104, file: !15, line: 87, column: 9)
!114 = !DILocation(line: 87, column: 14, scope: !113)
!115 = !DILocation(line: 87, column: 9, scope: !104)
!116 = !DILocation(line: 87, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 87, column: 23)
!118 = !DILocation(line: 88, column: 5, scope: !104)
!119 = !DILocation(line: 88, column: 13, scope: !104)
!120 = !DILocation(line: 89, column: 1, scope: !104)
!121 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 63, type: !22, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", arg: 1, scope: !121, file: !15, line: 63, type: !4)
!123 = !DILocation(line: 63, column: 32, scope: !121)
!124 = !DILocalVariable(name: "source", scope: !125, file: !15, line: 66, type: !42)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 65, column: 5)
!126 = !DILocation(line: 66, column: 14, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !125, file: !15, line: 67, type: !47)
!128 = !DILocation(line: 67, column: 16, scope: !125)
!129 = !DILocalVariable(name: "sourceLen", scope: !125, file: !15, line: 67, type: !47)
!130 = !DILocation(line: 67, column: 19, scope: !125)
!131 = !DILocation(line: 68, column: 28, scope: !125)
!132 = !DILocation(line: 68, column: 21, scope: !125)
!133 = !DILocation(line: 68, column: 19, scope: !125)
!134 = !DILocation(line: 71, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !125, file: !15, line: 71, column: 9)
!136 = !DILocation(line: 71, column: 14, scope: !135)
!137 = !DILocation(line: 71, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !15, line: 71, column: 9)
!139 = !DILocation(line: 71, column: 25, scope: !138)
!140 = !DILocation(line: 71, column: 35, scope: !138)
!141 = !DILocation(line: 71, column: 23, scope: !138)
!142 = !DILocation(line: 71, column: 9, scope: !135)
!143 = !DILocation(line: 73, column: 30, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !15, line: 72, column: 9)
!145 = !DILocation(line: 73, column: 23, scope: !144)
!146 = !DILocation(line: 73, column: 13, scope: !144)
!147 = !DILocation(line: 73, column: 18, scope: !144)
!148 = !DILocation(line: 73, column: 21, scope: !144)
!149 = !DILocation(line: 74, column: 9, scope: !144)
!150 = !DILocation(line: 71, column: 41, scope: !138)
!151 = !DILocation(line: 71, column: 9, scope: !138)
!152 = distinct !{!152, !142, !153, !76}
!153 = !DILocation(line: 74, column: 9, scope: !135)
!154 = !DILocation(line: 75, column: 19, scope: !125)
!155 = !DILocation(line: 75, column: 9, scope: !125)
!156 = !DILocation(line: 76, column: 14, scope: !125)
!157 = !DILocation(line: 76, column: 9, scope: !125)
!158 = !DILocation(line: 78, column: 1, scope: !121)
