; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_badSink(i32* %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !22, metadata !DIExpression()), !dbg !27
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !28, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !32, metadata !DIExpression()), !dbg !33
  %1 = load i32*, i32** %data.addr, align 8, !dbg !34
  %call = call i64 @wcslen(i32* %1) #7, !dbg !35
  store i64 %call, i64* %dataLen, align 8, !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !40
  %3 = load i64, i64* %dataLen, align 8, !dbg !42
  %cmp = icmp ult i64 %2, %3, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !45
  %5 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !45
  %6 = load i32, i32* %arrayidx, align 4, !dbg !45
  %7 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !49
  store i32 %6, i32* %arrayidx1, align 4, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !52
  %inc = add i64 %8, 1, !dbg !52
  store i64 %inc, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !57
  store i32 0, i32* %arrayidx2, align 4, !dbg !58
  %9 = load i32*, i32** %data.addr, align 8, !dbg !59
  call void @printWLine(i32* %9), !dbg !60
  %10 = load i32*, i32** %data.addr, align 8, !dbg !61
  %11 = bitcast i32* %10 to i8*, !dbg !61
  call void @free(i8* %11) #8, !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_bad() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !69
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
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #8, !dbg !79
  %3 = load i32*, i32** %data, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !80
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  %4 = load i32*, i32** %data, align 8, !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_badSink(i32* %4), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #6

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_goodG2BSink(i32* %data) #0 !dbg !85 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !88, metadata !DIExpression()), !dbg !90
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !90
  call void @llvm.dbg.declare(metadata i64* %i, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !93, metadata !DIExpression()), !dbg !94
  %1 = load i32*, i32** %data.addr, align 8, !dbg !95
  %call = call i64 @wcslen(i32* %1) #7, !dbg !96
  store i64 %call, i64* %dataLen, align 8, !dbg !97
  store i64 0, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !101
  %3 = load i64, i64* %dataLen, align 8, !dbg !103
  %cmp = icmp ult i64 %2, %3, !dbg !104
  br i1 %cmp, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !106
  %5 = load i64, i64* %i, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !106
  %6 = load i32, i32* %arrayidx, align 4, !dbg !106
  %7 = load i64, i64* %i, align 8, !dbg !109
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !110
  store i32 %6, i32* %arrayidx1, align 4, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !113
  %inc = add i64 %8, 1, !dbg !113
  store i64 %inc, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !117
  store i32 0, i32* %arrayidx2, align 4, !dbg !118
  %9 = load i32*, i32** %data.addr, align 8, !dbg !119
  call void @printWLine(i32* %9), !dbg !120
  %10 = load i32*, i32** %data.addr, align 8, !dbg !121
  %11 = bitcast i32* %10 to i8*, !dbg !121
  call void @free(i8* %11) #8, !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_good() #0 !dbg !124 {
entry:
  call void @goodG2B(), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !127 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !133, metadata !DIExpression()), !dbg !134
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !135, metadata !DIExpression()), !dbg !136
  %call = call i64 @time(i64* null) #8, !dbg !137
  %conv = trunc i64 %call to i32, !dbg !138
  call void @srand(i32 %conv) #8, !dbg !139
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !140
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_good(), !dbg !141
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !142
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !143
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_bad(), !dbg !144
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !145
  ret i32 0, !dbg !146
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !147 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !148, metadata !DIExpression()), !dbg !149
  %call = call noalias align 16 i8* @malloc(i64 400) #8, !dbg !150
  %0 = bitcast i8* %call to i32*, !dbg !151
  store i32* %0, i32** %data, align 8, !dbg !152
  %1 = load i32*, i32** %data, align 8, !dbg !153
  %cmp = icmp eq i32* %1, null, !dbg !155
  br i1 %cmp, label %if.then, label %if.end, !dbg !156

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !157
  unreachable, !dbg !157

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !159
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #8, !dbg !160
  %3 = load i32*, i32** %data, align 8, !dbg !161
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !161
  store i32 0, i32* %arrayidx, align 4, !dbg !162
  %4 = load i32*, i32** %data, align 8, !dbg !163
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_goodG2BSink(i32* %4), !dbg !164
  ret void, !dbg !165
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_badSink", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !4}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 23, type: !4)
!21 = !DILocation(line: 23, column: 84, scope: !16)
!22 = !DILocalVariable(name: "dest", scope: !23, file: !17, line: 26, type: !24)
!23 = distinct !DILexicalBlock(scope: !16, file: !17, line: 25, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 26, column: 17, scope: !23)
!28 = !DILocalVariable(name: "i", scope: !23, file: !17, line: 27, type: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !30)
!30 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 27, column: 16, scope: !23)
!32 = !DILocalVariable(name: "dataLen", scope: !23, file: !17, line: 27, type: !29)
!33 = !DILocation(line: 27, column: 19, scope: !23)
!34 = !DILocation(line: 28, column: 26, scope: !23)
!35 = !DILocation(line: 28, column: 19, scope: !23)
!36 = !DILocation(line: 28, column: 17, scope: !23)
!37 = !DILocation(line: 30, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !23, file: !17, line: 30, column: 9)
!39 = !DILocation(line: 30, column: 14, scope: !38)
!40 = !DILocation(line: 30, column: 21, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !17, line: 30, column: 9)
!42 = !DILocation(line: 30, column: 25, scope: !41)
!43 = !DILocation(line: 30, column: 23, scope: !41)
!44 = !DILocation(line: 30, column: 9, scope: !38)
!45 = !DILocation(line: 32, column: 23, scope: !46)
!46 = distinct !DILexicalBlock(scope: !41, file: !17, line: 31, column: 9)
!47 = !DILocation(line: 32, column: 28, scope: !46)
!48 = !DILocation(line: 32, column: 18, scope: !46)
!49 = !DILocation(line: 32, column: 13, scope: !46)
!50 = !DILocation(line: 32, column: 21, scope: !46)
!51 = !DILocation(line: 33, column: 9, scope: !46)
!52 = !DILocation(line: 30, column: 35, scope: !41)
!53 = !DILocation(line: 30, column: 9, scope: !41)
!54 = distinct !{!54, !44, !55, !56}
!55 = !DILocation(line: 33, column: 9, scope: !38)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 34, column: 9, scope: !23)
!58 = !DILocation(line: 34, column: 20, scope: !23)
!59 = !DILocation(line: 35, column: 20, scope: !23)
!60 = !DILocation(line: 35, column: 9, scope: !23)
!61 = !DILocation(line: 36, column: 14, scope: !23)
!62 = !DILocation(line: 36, column: 9, scope: !23)
!63 = !DILocation(line: 38, column: 1, scope: !16)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_bad", scope: !17, file: !17, line: 40, type: !65, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{null}
!67 = !DILocalVariable(name: "data", scope: !64, file: !17, line: 42, type: !4)
!68 = !DILocation(line: 42, column: 15, scope: !64)
!69 = !DILocation(line: 43, column: 23, scope: !64)
!70 = !DILocation(line: 43, column: 12, scope: !64)
!71 = !DILocation(line: 43, column: 10, scope: !64)
!72 = !DILocation(line: 44, column: 9, scope: !73)
!73 = distinct !DILexicalBlock(scope: !64, file: !17, line: 44, column: 9)
!74 = !DILocation(line: 44, column: 14, scope: !73)
!75 = !DILocation(line: 44, column: 9, scope: !64)
!76 = !DILocation(line: 44, column: 24, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !17, line: 44, column: 23)
!78 = !DILocation(line: 46, column: 13, scope: !64)
!79 = !DILocation(line: 46, column: 5, scope: !64)
!80 = !DILocation(line: 47, column: 5, scope: !64)
!81 = !DILocation(line: 47, column: 17, scope: !64)
!82 = !DILocation(line: 48, column: 73, scope: !64)
!83 = !DILocation(line: 48, column: 5, scope: !64)
!84 = !DILocation(line: 49, column: 1, scope: !64)
!85 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_goodG2BSink", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", arg: 1, scope: !85, file: !17, line: 55, type: !4)
!87 = !DILocation(line: 55, column: 88, scope: !85)
!88 = !DILocalVariable(name: "dest", scope: !89, file: !17, line: 58, type: !24)
!89 = distinct !DILexicalBlock(scope: !85, file: !17, line: 57, column: 5)
!90 = !DILocation(line: 58, column: 17, scope: !89)
!91 = !DILocalVariable(name: "i", scope: !89, file: !17, line: 59, type: !29)
!92 = !DILocation(line: 59, column: 16, scope: !89)
!93 = !DILocalVariable(name: "dataLen", scope: !89, file: !17, line: 59, type: !29)
!94 = !DILocation(line: 59, column: 19, scope: !89)
!95 = !DILocation(line: 60, column: 26, scope: !89)
!96 = !DILocation(line: 60, column: 19, scope: !89)
!97 = !DILocation(line: 60, column: 17, scope: !89)
!98 = !DILocation(line: 62, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !89, file: !17, line: 62, column: 9)
!100 = !DILocation(line: 62, column: 14, scope: !99)
!101 = !DILocation(line: 62, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !17, line: 62, column: 9)
!103 = !DILocation(line: 62, column: 25, scope: !102)
!104 = !DILocation(line: 62, column: 23, scope: !102)
!105 = !DILocation(line: 62, column: 9, scope: !99)
!106 = !DILocation(line: 64, column: 23, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !17, line: 63, column: 9)
!108 = !DILocation(line: 64, column: 28, scope: !107)
!109 = !DILocation(line: 64, column: 18, scope: !107)
!110 = !DILocation(line: 64, column: 13, scope: !107)
!111 = !DILocation(line: 64, column: 21, scope: !107)
!112 = !DILocation(line: 65, column: 9, scope: !107)
!113 = !DILocation(line: 62, column: 35, scope: !102)
!114 = !DILocation(line: 62, column: 9, scope: !102)
!115 = distinct !{!115, !105, !116, !56}
!116 = !DILocation(line: 65, column: 9, scope: !99)
!117 = !DILocation(line: 66, column: 9, scope: !89)
!118 = !DILocation(line: 66, column: 20, scope: !89)
!119 = !DILocation(line: 67, column: 20, scope: !89)
!120 = !DILocation(line: 67, column: 9, scope: !89)
!121 = !DILocation(line: 68, column: 14, scope: !89)
!122 = !DILocation(line: 68, column: 9, scope: !89)
!123 = !DILocation(line: 70, column: 1, scope: !85)
!124 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_good", scope: !17, file: !17, line: 84, type: !65, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocation(line: 86, column: 5, scope: !124)
!126 = !DILocation(line: 87, column: 1, scope: !124)
!127 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 99, type: !128, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!128 = !DISubroutineType(types: !129)
!129 = !{!7, !7, !130}
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !131, size: 64)
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!132 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!133 = !DILocalVariable(name: "argc", arg: 1, scope: !127, file: !17, line: 99, type: !7)
!134 = !DILocation(line: 99, column: 14, scope: !127)
!135 = !DILocalVariable(name: "argv", arg: 2, scope: !127, file: !17, line: 99, type: !130)
!136 = !DILocation(line: 99, column: 27, scope: !127)
!137 = !DILocation(line: 102, column: 22, scope: !127)
!138 = !DILocation(line: 102, column: 12, scope: !127)
!139 = !DILocation(line: 102, column: 5, scope: !127)
!140 = !DILocation(line: 104, column: 5, scope: !127)
!141 = !DILocation(line: 105, column: 5, scope: !127)
!142 = !DILocation(line: 106, column: 5, scope: !127)
!143 = !DILocation(line: 109, column: 5, scope: !127)
!144 = !DILocation(line: 110, column: 5, scope: !127)
!145 = !DILocation(line: 111, column: 5, scope: !127)
!146 = !DILocation(line: 113, column: 5, scope: !127)
!147 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 73, type: !65, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!148 = !DILocalVariable(name: "data", scope: !147, file: !17, line: 75, type: !4)
!149 = !DILocation(line: 75, column: 15, scope: !147)
!150 = !DILocation(line: 76, column: 23, scope: !147)
!151 = !DILocation(line: 76, column: 12, scope: !147)
!152 = !DILocation(line: 76, column: 10, scope: !147)
!153 = !DILocation(line: 77, column: 9, scope: !154)
!154 = distinct !DILexicalBlock(scope: !147, file: !17, line: 77, column: 9)
!155 = !DILocation(line: 77, column: 14, scope: !154)
!156 = !DILocation(line: 77, column: 9, scope: !147)
!157 = !DILocation(line: 77, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !17, line: 77, column: 23)
!159 = !DILocation(line: 79, column: 13, scope: !147)
!160 = !DILocation(line: 79, column: 5, scope: !147)
!161 = !DILocation(line: 80, column: 5, scope: !147)
!162 = !DILocation(line: 80, column: 16, scope: !147)
!163 = !DILocation(line: 81, column: 77, scope: !147)
!164 = !DILocation(line: 81, column: 5, scope: !147)
!165 = !DILocation(line: 82, column: 1, scope: !147)
