; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_12.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_12_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_12_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !26
  %0 = bitcast i8* %call1 to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !36

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !37
  %2 = bitcast i8* %call3 to i32*, !dbg !39
  store i32* %2, i32** %data, align 8, !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %cmp4 = icmp eq i32* %3, null, !dbg !43
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !44

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !45
  unreachable, !dbg !45

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_12_bad.source to i8*), i64 44, i1 false), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %i, metadata !53, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !57, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !59
  %call8 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !60
  store i64 %call8, i64* %sourceLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end7
  %5 = load i64, i64* %i, align 8, !dbg !65
  %6 = load i64, i64* %sourceLen, align 8, !dbg !67
  %add = add i64 %6, 1, !dbg !68
  %cmp9 = icmp ult i64 %5, %add, !dbg !69
  br i1 %cmp9, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %7, !dbg !73
  %8 = load i32, i32* %arrayidx, align 4, !dbg !73
  %9 = load i32*, i32** %data, align 8, !dbg !74
  %10 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !74
  store i32 %8, i32* %arrayidx10, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %11, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* %12), !dbg !84
  %13 = load i32*, i32** %data, align 8, !dbg !85
  %14 = bitcast i32* %13 to i8*, !dbg !85
  call void @free(i8* %14) #7, !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #6

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_12_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* null) #7, !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 %conv) #7, !dbg !103
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_12_good(), !dbg !105
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_12_bad(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  store i32* null, i32** %data, align 8, !dbg !114
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !115
  %tobool = icmp ne i32 %call, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !118
  %0 = bitcast i8* %call1 to i32*, !dbg !120
  store i32* %0, i32** %data, align 8, !dbg !121
  %1 = load i32*, i32** %data, align 8, !dbg !122
  %cmp = icmp eq i32* %1, null, !dbg !124
  br i1 %cmp, label %if.then2, label %if.end, !dbg !125

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #8, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %if.then
  br label %if.end7, !dbg !128

if.else:                                          ; preds = %entry
  %call3 = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !129
  %2 = bitcast i8* %call3 to i32*, !dbg !131
  store i32* %2, i32** %data, align 8, !dbg !132
  %3 = load i32*, i32** %data, align 8, !dbg !133
  %cmp4 = icmp eq i32* %3, null, !dbg !135
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !136

if.then5:                                         ; preds = %if.else
  call void @exit(i32 -1) #8, !dbg !137
  unreachable, !dbg !137

if.end6:                                          ; preds = %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %if.end
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !139, metadata !DIExpression()), !dbg !141
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !141
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %i, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !146
  %call8 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !147
  store i64 %call8, i64* %sourceLen, align 8, !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end7
  %5 = load i64, i64* %i, align 8, !dbg !152
  %6 = load i64, i64* %sourceLen, align 8, !dbg !154
  %add = add i64 %6, 1, !dbg !155
  %cmp9 = icmp ult i64 %5, %add, !dbg !156
  br i1 %cmp9, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %7, !dbg !160
  %8 = load i32, i32* %arrayidx, align 4, !dbg !160
  %9 = load i32*, i32** %data, align 8, !dbg !161
  %10 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !161
  store i32 %8, i32* %arrayidx10, align 4, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %11, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !169
  call void @printWLine(i32* %12), !dbg !170
  %13 = load i32*, i32** %data, align 8, !dbg !171
  %14 = bitcast i32* %13 to i8*, !dbg !171
  call void @free(i8* %14) #7, !dbg !172
  ret void, !dbg !173
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_12_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocation(line: 31, column: 10, scope: !16)
!23 = !DILocation(line: 32, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 32, column: 8)
!25 = !DILocation(line: 32, column: 8, scope: !16)
!26 = !DILocation(line: 35, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 33, column: 5)
!28 = !DILocation(line: 35, column: 16, scope: !27)
!29 = !DILocation(line: 35, column: 14, scope: !27)
!30 = !DILocation(line: 36, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 36, column: 13)
!32 = !DILocation(line: 36, column: 18, scope: !31)
!33 = !DILocation(line: 36, column: 13, scope: !27)
!34 = !DILocation(line: 36, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 36, column: 27)
!36 = !DILocation(line: 37, column: 5, scope: !27)
!37 = !DILocation(line: 41, column: 27, scope: !38)
!38 = distinct !DILexicalBlock(scope: !24, file: !17, line: 39, column: 5)
!39 = !DILocation(line: 41, column: 16, scope: !38)
!40 = !DILocation(line: 41, column: 14, scope: !38)
!41 = !DILocation(line: 42, column: 13, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !17, line: 42, column: 13)
!43 = !DILocation(line: 42, column: 18, scope: !42)
!44 = !DILocation(line: 42, column: 13, scope: !38)
!45 = !DILocation(line: 42, column: 28, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !17, line: 42, column: 27)
!47 = !DILocalVariable(name: "source", scope: !48, file: !17, line: 45, type: !49)
!48 = distinct !DILexicalBlock(scope: !16, file: !17, line: 44, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 11)
!52 = !DILocation(line: 45, column: 17, scope: !48)
!53 = !DILocalVariable(name: "i", scope: !48, file: !17, line: 46, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !55)
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 46, column: 16, scope: !48)
!57 = !DILocalVariable(name: "sourceLen", scope: !48, file: !17, line: 46, type: !54)
!58 = !DILocation(line: 46, column: 19, scope: !48)
!59 = !DILocation(line: 47, column: 28, scope: !48)
!60 = !DILocation(line: 47, column: 21, scope: !48)
!61 = !DILocation(line: 47, column: 19, scope: !48)
!62 = !DILocation(line: 50, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !48, file: !17, line: 50, column: 9)
!64 = !DILocation(line: 50, column: 14, scope: !63)
!65 = !DILocation(line: 50, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !17, line: 50, column: 9)
!67 = !DILocation(line: 50, column: 25, scope: !66)
!68 = !DILocation(line: 50, column: 35, scope: !66)
!69 = !DILocation(line: 50, column: 23, scope: !66)
!70 = !DILocation(line: 50, column: 9, scope: !63)
!71 = !DILocation(line: 52, column: 30, scope: !72)
!72 = distinct !DILexicalBlock(scope: !66, file: !17, line: 51, column: 9)
!73 = !DILocation(line: 52, column: 23, scope: !72)
!74 = !DILocation(line: 52, column: 13, scope: !72)
!75 = !DILocation(line: 52, column: 18, scope: !72)
!76 = !DILocation(line: 52, column: 21, scope: !72)
!77 = !DILocation(line: 53, column: 9, scope: !72)
!78 = !DILocation(line: 50, column: 41, scope: !66)
!79 = !DILocation(line: 50, column: 9, scope: !66)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 53, column: 9, scope: !63)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 54, column: 20, scope: !48)
!84 = !DILocation(line: 54, column: 9, scope: !48)
!85 = !DILocation(line: 55, column: 14, scope: !48)
!86 = !DILocation(line: 55, column: 9, scope: !48)
!87 = !DILocation(line: 57, column: 1, scope: !16)
!88 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_12_good", scope: !17, file: !17, line: 96, type: !18, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocation(line: 98, column: 5, scope: !88)
!90 = !DILocation(line: 99, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 111, type: !92, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!7, !7, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !17, line: 111, type: !7)
!98 = !DILocation(line: 111, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !17, line: 111, type: !94)
!100 = !DILocation(line: 111, column: 27, scope: !91)
!101 = !DILocation(line: 114, column: 22, scope: !91)
!102 = !DILocation(line: 114, column: 12, scope: !91)
!103 = !DILocation(line: 114, column: 5, scope: !91)
!104 = !DILocation(line: 116, column: 5, scope: !91)
!105 = !DILocation(line: 117, column: 5, scope: !91)
!106 = !DILocation(line: 118, column: 5, scope: !91)
!107 = !DILocation(line: 121, column: 5, scope: !91)
!108 = !DILocation(line: 122, column: 5, scope: !91)
!109 = !DILocation(line: 123, column: 5, scope: !91)
!110 = !DILocation(line: 125, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 65, type: !18, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !17, line: 67, type: !4)
!113 = !DILocation(line: 67, column: 15, scope: !111)
!114 = !DILocation(line: 68, column: 10, scope: !111)
!115 = !DILocation(line: 69, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !111, file: !17, line: 69, column: 8)
!117 = !DILocation(line: 69, column: 8, scope: !111)
!118 = !DILocation(line: 72, column: 27, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !17, line: 70, column: 5)
!120 = !DILocation(line: 72, column: 16, scope: !119)
!121 = !DILocation(line: 72, column: 14, scope: !119)
!122 = !DILocation(line: 73, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !17, line: 73, column: 13)
!124 = !DILocation(line: 73, column: 18, scope: !123)
!125 = !DILocation(line: 73, column: 13, scope: !119)
!126 = !DILocation(line: 73, column: 28, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !17, line: 73, column: 27)
!128 = !DILocation(line: 74, column: 5, scope: !119)
!129 = !DILocation(line: 78, column: 27, scope: !130)
!130 = distinct !DILexicalBlock(scope: !116, file: !17, line: 76, column: 5)
!131 = !DILocation(line: 78, column: 16, scope: !130)
!132 = !DILocation(line: 78, column: 14, scope: !130)
!133 = !DILocation(line: 79, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !17, line: 79, column: 13)
!135 = !DILocation(line: 79, column: 18, scope: !134)
!136 = !DILocation(line: 79, column: 13, scope: !130)
!137 = !DILocation(line: 79, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !17, line: 79, column: 27)
!139 = !DILocalVariable(name: "source", scope: !140, file: !17, line: 82, type: !49)
!140 = distinct !DILexicalBlock(scope: !111, file: !17, line: 81, column: 5)
!141 = !DILocation(line: 82, column: 17, scope: !140)
!142 = !DILocalVariable(name: "i", scope: !140, file: !17, line: 83, type: !54)
!143 = !DILocation(line: 83, column: 16, scope: !140)
!144 = !DILocalVariable(name: "sourceLen", scope: !140, file: !17, line: 83, type: !54)
!145 = !DILocation(line: 83, column: 19, scope: !140)
!146 = !DILocation(line: 84, column: 28, scope: !140)
!147 = !DILocation(line: 84, column: 21, scope: !140)
!148 = !DILocation(line: 84, column: 19, scope: !140)
!149 = !DILocation(line: 87, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !140, file: !17, line: 87, column: 9)
!151 = !DILocation(line: 87, column: 14, scope: !150)
!152 = !DILocation(line: 87, column: 21, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !17, line: 87, column: 9)
!154 = !DILocation(line: 87, column: 25, scope: !153)
!155 = !DILocation(line: 87, column: 35, scope: !153)
!156 = !DILocation(line: 87, column: 23, scope: !153)
!157 = !DILocation(line: 87, column: 9, scope: !150)
!158 = !DILocation(line: 89, column: 30, scope: !159)
!159 = distinct !DILexicalBlock(scope: !153, file: !17, line: 88, column: 9)
!160 = !DILocation(line: 89, column: 23, scope: !159)
!161 = !DILocation(line: 89, column: 13, scope: !159)
!162 = !DILocation(line: 89, column: 18, scope: !159)
!163 = !DILocation(line: 89, column: 21, scope: !159)
!164 = !DILocation(line: 90, column: 9, scope: !159)
!165 = !DILocation(line: 87, column: 41, scope: !153)
!166 = !DILocation(line: 87, column: 9, scope: !153)
!167 = distinct !{!167, !157, !168, !82}
!168 = !DILocation(line: 90, column: 9, scope: !150)
!169 = !DILocation(line: 91, column: 20, scope: !140)
!170 = !DILocation(line: 91, column: 9, scope: !140)
!171 = !DILocation(line: 92, column: 14, scope: !140)
!172 = !DILocation(line: 92, column: 9, scope: !140)
!173 = !DILocation(line: 94, column: 1, scope: !111)
