; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !27
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_badSink.source to i8*), i64 44, i1 false), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !28, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !32, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !34
  %call = call i64 @wcslen(i32* %arraydecay) #7, !dbg !35
  store i64 %call, i64* %sourceLen, align 8, !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !40
  %2 = load i64, i64* %sourceLen, align 8, !dbg !42
  %add = add i64 %2, 1, !dbg !43
  %cmp = icmp ult i64 %1, %add, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !46
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %3, !dbg !48
  %4 = load i32, i32* %arrayidx, align 4, !dbg !48
  %5 = load i32*, i32** %data.addr, align 8, !dbg !49
  %6 = load i64, i64* %i, align 8, !dbg !50
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !49
  store i32 %4, i32* %arrayidx1, align 4, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %7, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data.addr, align 8, !dbg !58
  call void @printWLine(i32* %8), !dbg !59
  %9 = load i32*, i32** %data.addr, align 8, !dbg !60
  %10 = bitcast i32* %9 to i8*, !dbg !60
  call void @free(i8* %10) #8, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_bad() #0 !dbg !63 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  store i32* null, i32** %data, align 8, !dbg !68
  %call = call noalias align 16 i8* @malloc(i64 40) #8, !dbg !69
  %0 = bitcast i8* %call to i32*, !dbg !70
  store i32* %0, i32** %data, align 8, !dbg !71
  %1 = load i32*, i32** %data, align 8, !dbg !72
  %cmp = icmp eq i32* %1, null, !dbg !74
  br i1 %cmp, label %if.then, label %if.end, !dbg !75

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !76
  unreachable, !dbg !76

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_badSink(i32* %2), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_goodG2BSink(i32* %data) #0 !dbg !81 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !84, metadata !DIExpression()), !dbg !86
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !86
  call void @llvm.dbg.declare(metadata i64* %i, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !89, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !91
  %call = call i64 @wcslen(i32* %arraydecay) #7, !dbg !92
  store i64 %call, i64* %sourceLen, align 8, !dbg !93
  store i64 0, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !96

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !97
  %2 = load i64, i64* %sourceLen, align 8, !dbg !99
  %add = add i64 %2, 1, !dbg !100
  %cmp = icmp ult i64 %1, %add, !dbg !101
  br i1 %cmp, label %for.body, label %for.end, !dbg !102

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %3, !dbg !105
  %4 = load i32, i32* %arrayidx, align 4, !dbg !105
  %5 = load i32*, i32** %data.addr, align 8, !dbg !106
  %6 = load i64, i64* %i, align 8, !dbg !107
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !106
  store i32 %4, i32* %arrayidx1, align 4, !dbg !108
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !110
  %inc = add i64 %7, 1, !dbg !110
  store i64 %inc, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data.addr, align 8, !dbg !114
  call void @printWLine(i32* %8), !dbg !115
  %9 = load i32*, i32** %data.addr, align 8, !dbg !116
  %10 = bitcast i32* %9 to i8*, !dbg !116
  call void @free(i8* %10) #8, !dbg !117
  ret void, !dbg !118
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_good() #0 !dbg !119 {
entry:
  call void @goodG2B(), !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !122 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !128, metadata !DIExpression()), !dbg !129
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !130, metadata !DIExpression()), !dbg !131
  %call = call i64 @time(i64* null) #8, !dbg !132
  %conv = trunc i64 %call to i32, !dbg !133
  call void @srand(i32 %conv) #8, !dbg !134
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !135
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_good(), !dbg !136
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !137
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !138
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_bad(), !dbg !139
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !140
  ret i32 0, !dbg !141
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !142 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !143, metadata !DIExpression()), !dbg !144
  store i32* null, i32** %data, align 8, !dbg !145
  %call = call noalias align 16 i8* @malloc(i64 44) #8, !dbg !146
  %0 = bitcast i8* %call to i32*, !dbg !147
  store i32* %0, i32** %data, align 8, !dbg !148
  %1 = load i32*, i32** %data, align 8, !dbg !149
  %cmp = icmp eq i32* %1, null, !dbg !151
  br i1 %cmp, label %if.then, label %if.end, !dbg !152

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !153
  unreachable, !dbg !153

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !155
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_goodG2BSink(i32* %2), !dbg !156
  ret void, !dbg !157
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
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_badSink", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 28, type: !4)
!21 = !DILocation(line: 28, column: 84, scope: !16)
!22 = !DILocalVariable(name: "source", scope: !23, file: !17, line: 31, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 30, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 11)
!27 = !DILocation(line: 31, column: 17, scope: !23)
!28 = !DILocalVariable(name: "i", scope: !23, file: !17, line: 32, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !30)
!30 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 32, column: 16, scope: !23)
!32 = !DILocalVariable(name: "sourceLen", scope: !23, file: !17, line: 32, type: !29)
!33 = !DILocation(line: 32, column: 19, scope: !23)
!34 = !DILocation(line: 33, column: 28, scope: !23)
!35 = !DILocation(line: 33, column: 21, scope: !23)
!36 = !DILocation(line: 33, column: 19, scope: !23)
!37 = !DILocation(line: 36, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !23, file: !17, line: 36, column: 9)
!39 = !DILocation(line: 36, column: 14, scope: !38)
!40 = !DILocation(line: 36, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !17, line: 36, column: 9)
!42 = !DILocation(line: 36, column: 25, scope: !41)
!43 = !DILocation(line: 36, column: 35, scope: !41)
!44 = !DILocation(line: 36, column: 23, scope: !41)
!45 = !DILocation(line: 36, column: 9, scope: !38)
!46 = !DILocation(line: 38, column: 30, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !17, line: 37, column: 9)
!48 = !DILocation(line: 38, column: 23, scope: !47)
!49 = !DILocation(line: 38, column: 13, scope: !47)
!50 = !DILocation(line: 38, column: 18, scope: !47)
!51 = !DILocation(line: 38, column: 21, scope: !47)
!52 = !DILocation(line: 39, column: 9, scope: !47)
!53 = !DILocation(line: 36, column: 41, scope: !41)
!54 = !DILocation(line: 36, column: 9, scope: !41)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 39, column: 9, scope: !38)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 40, column: 20, scope: !23)
!59 = !DILocation(line: 40, column: 9, scope: !23)
!60 = !DILocation(line: 41, column: 14, scope: !23)
!61 = !DILocation(line: 41, column: 9, scope: !23)
!62 = !DILocation(line: 43, column: 1, scope: !16)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_bad", scope: !17, file: !17, line: 45, type: !64, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{null}
!66 = !DILocalVariable(name: "data", scope: !63, file: !17, line: 47, type: !4)
!67 = !DILocation(line: 47, column: 15, scope: !63)
!68 = !DILocation(line: 48, column: 10, scope: !63)
!69 = !DILocation(line: 50, column: 23, scope: !63)
!70 = !DILocation(line: 50, column: 12, scope: !63)
!71 = !DILocation(line: 50, column: 10, scope: !63)
!72 = !DILocation(line: 51, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !63, file: !17, line: 51, column: 9)
!74 = !DILocation(line: 51, column: 14, scope: !73)
!75 = !DILocation(line: 51, column: 9, scope: !63)
!76 = !DILocation(line: 51, column: 24, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !17, line: 51, column: 23)
!78 = !DILocation(line: 52, column: 73, scope: !63)
!79 = !DILocation(line: 52, column: 5, scope: !63)
!80 = !DILocation(line: 53, column: 1, scope: !63)
!81 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_goodG2BSink", scope: !17, file: !17, line: 59, type: !18, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", arg: 1, scope: !81, file: !17, line: 59, type: !4)
!83 = !DILocation(line: 59, column: 88, scope: !81)
!84 = !DILocalVariable(name: "source", scope: !85, file: !17, line: 62, type: !24)
!85 = distinct !DILexicalBlock(scope: !81, file: !17, line: 61, column: 5)
!86 = !DILocation(line: 62, column: 17, scope: !85)
!87 = !DILocalVariable(name: "i", scope: !85, file: !17, line: 63, type: !29)
!88 = !DILocation(line: 63, column: 16, scope: !85)
!89 = !DILocalVariable(name: "sourceLen", scope: !85, file: !17, line: 63, type: !29)
!90 = !DILocation(line: 63, column: 19, scope: !85)
!91 = !DILocation(line: 64, column: 28, scope: !85)
!92 = !DILocation(line: 64, column: 21, scope: !85)
!93 = !DILocation(line: 64, column: 19, scope: !85)
!94 = !DILocation(line: 67, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !85, file: !17, line: 67, column: 9)
!96 = !DILocation(line: 67, column: 14, scope: !95)
!97 = !DILocation(line: 67, column: 21, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !17, line: 67, column: 9)
!99 = !DILocation(line: 67, column: 25, scope: !98)
!100 = !DILocation(line: 67, column: 35, scope: !98)
!101 = !DILocation(line: 67, column: 23, scope: !98)
!102 = !DILocation(line: 67, column: 9, scope: !95)
!103 = !DILocation(line: 69, column: 30, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !17, line: 68, column: 9)
!105 = !DILocation(line: 69, column: 23, scope: !104)
!106 = !DILocation(line: 69, column: 13, scope: !104)
!107 = !DILocation(line: 69, column: 18, scope: !104)
!108 = !DILocation(line: 69, column: 21, scope: !104)
!109 = !DILocation(line: 70, column: 9, scope: !104)
!110 = !DILocation(line: 67, column: 41, scope: !98)
!111 = !DILocation(line: 67, column: 9, scope: !98)
!112 = distinct !{!112, !102, !113, !57}
!113 = !DILocation(line: 70, column: 9, scope: !95)
!114 = !DILocation(line: 71, column: 20, scope: !85)
!115 = !DILocation(line: 71, column: 9, scope: !85)
!116 = !DILocation(line: 72, column: 14, scope: !85)
!117 = !DILocation(line: 72, column: 9, scope: !85)
!118 = !DILocation(line: 74, column: 1, scope: !81)
!119 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_41_good", scope: !17, file: !17, line: 87, type: !64, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocation(line: 89, column: 5, scope: !119)
!121 = !DILocation(line: 90, column: 1, scope: !119)
!122 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 102, type: !123, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!123 = !DISubroutineType(types: !124)
!124 = !{!7, !7, !125}
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !126, size: 64)
!126 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !127, size: 64)
!127 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!128 = !DILocalVariable(name: "argc", arg: 1, scope: !122, file: !17, line: 102, type: !7)
!129 = !DILocation(line: 102, column: 14, scope: !122)
!130 = !DILocalVariable(name: "argv", arg: 2, scope: !122, file: !17, line: 102, type: !125)
!131 = !DILocation(line: 102, column: 27, scope: !122)
!132 = !DILocation(line: 105, column: 22, scope: !122)
!133 = !DILocation(line: 105, column: 12, scope: !122)
!134 = !DILocation(line: 105, column: 5, scope: !122)
!135 = !DILocation(line: 107, column: 5, scope: !122)
!136 = !DILocation(line: 108, column: 5, scope: !122)
!137 = !DILocation(line: 109, column: 5, scope: !122)
!138 = !DILocation(line: 112, column: 5, scope: !122)
!139 = !DILocation(line: 113, column: 5, scope: !122)
!140 = !DILocation(line: 114, column: 5, scope: !122)
!141 = !DILocation(line: 116, column: 5, scope: !122)
!142 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 77, type: !64, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!143 = !DILocalVariable(name: "data", scope: !142, file: !17, line: 79, type: !4)
!144 = !DILocation(line: 79, column: 15, scope: !142)
!145 = !DILocation(line: 80, column: 10, scope: !142)
!146 = !DILocation(line: 82, column: 23, scope: !142)
!147 = !DILocation(line: 82, column: 12, scope: !142)
!148 = !DILocation(line: 82, column: 10, scope: !142)
!149 = !DILocation(line: 83, column: 9, scope: !150)
!150 = distinct !DILexicalBlock(scope: !142, file: !17, line: 83, column: 9)
!151 = !DILocation(line: 83, column: 14, scope: !150)
!152 = !DILocation(line: 83, column: 9, scope: !142)
!153 = !DILocation(line: 83, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !17, line: 83, column: 23)
!155 = !DILocation(line: 84, column: 77, scope: !142)
!156 = !DILocation(line: 84, column: 5, scope: !142)
!157 = !DILocation(line: 85, column: 1, scope: !142)
