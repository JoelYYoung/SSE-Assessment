; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_32_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_32_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !22, metadata !DIExpression()), !dbg !24
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !25, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !26
  store i32* null, i32** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !28, metadata !DIExpression()), !dbg !30
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !31
  %1 = load i32*, i32** %0, align 8, !dbg !32
  store i32* %1, i32** %data1, align 8, !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 40) #7, !dbg !33
  %2 = bitcast i8* %call to i32*, !dbg !34
  store i32* %2, i32** %data1, align 8, !dbg !35
  %3 = load i32*, i32** %data1, align 8, !dbg !36
  %cmp = icmp eq i32* %3, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !42
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !43
  store i32* %4, i32** %5, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !48
  %7 = load i32*, i32** %6, align 8, !dbg !49
  store i32* %7, i32** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !50, metadata !DIExpression()), !dbg !55
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_32_bad.source to i8*), i64 44, i1 false), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %i, metadata !56, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !60, metadata !DIExpression()), !dbg !61
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !62
  %call3 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !63
  store i64 %call3, i64* %sourceLen, align 8, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !68
  %10 = load i64, i64* %sourceLen, align 8, !dbg !70
  %add = add i64 %10, 1, !dbg !71
  %cmp4 = icmp ult i64 %9, %add, !dbg !72
  br i1 %cmp4, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %11, !dbg !76
  %12 = load i32, i32* %arrayidx, align 4, !dbg !76
  %13 = load i32*, i32** %data2, align 8, !dbg !77
  %14 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx5 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !77
  store i32 %12, i32* %arrayidx5, align 4, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %15, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  %16 = load i32*, i32** %data2, align 8, !dbg !86
  call void @printWLine(i32* %16), !dbg !87
  %17 = load i32*, i32** %data2, align 8, !dbg !88
  %18 = bitcast i32* %17 to i8*, !dbg !88
  call void @free(i8* %18) #7, !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_32_good() #0 !dbg !91 {
entry:
  call void @goodG2B(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* null) #7, !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 %conv) #7, !dbg !106
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_32_good(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_32_bad(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !117, metadata !DIExpression()), !dbg !118
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !119, metadata !DIExpression()), !dbg !120
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !120
  store i32* null, i32** %data, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !122, metadata !DIExpression()), !dbg !124
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !125
  %1 = load i32*, i32** %0, align 8, !dbg !126
  store i32* %1, i32** %data1, align 8, !dbg !124
  %call = call noalias align 16 i8* @malloc(i64 44) #7, !dbg !127
  %2 = bitcast i8* %call to i32*, !dbg !128
  store i32* %2, i32** %data1, align 8, !dbg !129
  %3 = load i32*, i32** %data1, align 8, !dbg !130
  %cmp = icmp eq i32* %3, null, !dbg !132
  br i1 %cmp, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !136
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !137
  store i32* %4, i32** %5, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !139, metadata !DIExpression()), !dbg !141
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !142
  %7 = load i32*, i32** %6, align 8, !dbg !143
  store i32* %7, i32** %data2, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !144, metadata !DIExpression()), !dbg !146
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !146
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !146
  call void @llvm.dbg.declare(metadata i64* %i, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !149, metadata !DIExpression()), !dbg !150
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !151
  %call3 = call i64 @wcslen(i32* %arraydecay) #9, !dbg !152
  store i64 %call3, i64* %sourceLen, align 8, !dbg !153
  store i64 0, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !157
  %10 = load i64, i64* %sourceLen, align 8, !dbg !159
  %add = add i64 %10, 1, !dbg !160
  %cmp4 = icmp ult i64 %9, %add, !dbg !161
  br i1 %cmp4, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %11, !dbg !165
  %12 = load i32, i32* %arrayidx, align 4, !dbg !165
  %13 = load i32*, i32** %data2, align 8, !dbg !166
  %14 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx5 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !166
  store i32 %12, i32* %arrayidx5, align 4, !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !170
  %inc = add i64 %15, 1, !dbg !170
  store i64 %inc, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  %16 = load i32*, i32** %data2, align 8, !dbg !174
  call void @printWLine(i32* %16), !dbg !175
  %17 = load i32*, i32** %data2, align 8, !dbg !176
  %18 = bitcast i32* %17 to i8*, !dbg !176
  call void @free(i8* %18) #7, !dbg !177
  ret void, !dbg !178
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_32_bad", scope: !17, file: !17, line: 28, type: !18, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 30, type: !4)
!21 = !DILocation(line: 30, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataPtr1", scope: !16, file: !17, line: 31, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!24 = !DILocation(line: 31, column: 16, scope: !16)
!25 = !DILocalVariable(name: "dataPtr2", scope: !16, file: !17, line: 32, type: !23)
!26 = !DILocation(line: 32, column: 16, scope: !16)
!27 = !DILocation(line: 33, column: 10, scope: !16)
!28 = !DILocalVariable(name: "data", scope: !29, file: !17, line: 35, type: !4)
!29 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!30 = !DILocation(line: 35, column: 19, scope: !29)
!31 = !DILocation(line: 35, column: 27, scope: !29)
!32 = !DILocation(line: 35, column: 26, scope: !29)
!33 = !DILocation(line: 37, column: 27, scope: !29)
!34 = !DILocation(line: 37, column: 16, scope: !29)
!35 = !DILocation(line: 37, column: 14, scope: !29)
!36 = !DILocation(line: 38, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !17, line: 38, column: 13)
!38 = !DILocation(line: 38, column: 18, scope: !37)
!39 = !DILocation(line: 38, column: 13, scope: !29)
!40 = !DILocation(line: 38, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 38, column: 27)
!42 = !DILocation(line: 39, column: 21, scope: !29)
!43 = !DILocation(line: 39, column: 10, scope: !29)
!44 = !DILocation(line: 39, column: 19, scope: !29)
!45 = !DILocalVariable(name: "data", scope: !46, file: !17, line: 42, type: !4)
!46 = distinct !DILexicalBlock(scope: !16, file: !17, line: 41, column: 5)
!47 = !DILocation(line: 42, column: 19, scope: !46)
!48 = !DILocation(line: 42, column: 27, scope: !46)
!49 = !DILocation(line: 42, column: 26, scope: !46)
!50 = !DILocalVariable(name: "source", scope: !51, file: !17, line: 44, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !17, line: 43, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 11)
!55 = !DILocation(line: 44, column: 21, scope: !51)
!56 = !DILocalVariable(name: "i", scope: !51, file: !17, line: 45, type: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !58)
!58 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 45, column: 20, scope: !51)
!60 = !DILocalVariable(name: "sourceLen", scope: !51, file: !17, line: 45, type: !57)
!61 = !DILocation(line: 45, column: 23, scope: !51)
!62 = !DILocation(line: 46, column: 32, scope: !51)
!63 = !DILocation(line: 46, column: 25, scope: !51)
!64 = !DILocation(line: 46, column: 23, scope: !51)
!65 = !DILocation(line: 49, column: 20, scope: !66)
!66 = distinct !DILexicalBlock(scope: !51, file: !17, line: 49, column: 13)
!67 = !DILocation(line: 49, column: 18, scope: !66)
!68 = !DILocation(line: 49, column: 25, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !17, line: 49, column: 13)
!70 = !DILocation(line: 49, column: 29, scope: !69)
!71 = !DILocation(line: 49, column: 39, scope: !69)
!72 = !DILocation(line: 49, column: 27, scope: !69)
!73 = !DILocation(line: 49, column: 13, scope: !66)
!74 = !DILocation(line: 51, column: 34, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !17, line: 50, column: 13)
!76 = !DILocation(line: 51, column: 27, scope: !75)
!77 = !DILocation(line: 51, column: 17, scope: !75)
!78 = !DILocation(line: 51, column: 22, scope: !75)
!79 = !DILocation(line: 51, column: 25, scope: !75)
!80 = !DILocation(line: 52, column: 13, scope: !75)
!81 = !DILocation(line: 49, column: 45, scope: !69)
!82 = !DILocation(line: 49, column: 13, scope: !69)
!83 = distinct !{!83, !73, !84, !85}
!84 = !DILocation(line: 52, column: 13, scope: !66)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocation(line: 53, column: 24, scope: !51)
!87 = !DILocation(line: 53, column: 13, scope: !51)
!88 = !DILocation(line: 54, column: 18, scope: !51)
!89 = !DILocation(line: 54, column: 13, scope: !51)
!90 = !DILocation(line: 57, column: 1, scope: !16)
!91 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_32_good", scope: !17, file: !17, line: 95, type: !18, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 97, column: 5, scope: !91)
!93 = !DILocation(line: 98, column: 1, scope: !91)
!94 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 109, type: !95, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!7, !7, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !17, line: 109, type: !7)
!101 = !DILocation(line: 109, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !17, line: 109, type: !97)
!103 = !DILocation(line: 109, column: 27, scope: !94)
!104 = !DILocation(line: 112, column: 22, scope: !94)
!105 = !DILocation(line: 112, column: 12, scope: !94)
!106 = !DILocation(line: 112, column: 5, scope: !94)
!107 = !DILocation(line: 114, column: 5, scope: !94)
!108 = !DILocation(line: 115, column: 5, scope: !94)
!109 = !DILocation(line: 116, column: 5, scope: !94)
!110 = !DILocation(line: 119, column: 5, scope: !94)
!111 = !DILocation(line: 120, column: 5, scope: !94)
!112 = !DILocation(line: 121, column: 5, scope: !94)
!113 = !DILocation(line: 123, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 64, type: !18, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !17, line: 66, type: !4)
!116 = !DILocation(line: 66, column: 15, scope: !114)
!117 = !DILocalVariable(name: "dataPtr1", scope: !114, file: !17, line: 67, type: !23)
!118 = !DILocation(line: 67, column: 16, scope: !114)
!119 = !DILocalVariable(name: "dataPtr2", scope: !114, file: !17, line: 68, type: !23)
!120 = !DILocation(line: 68, column: 16, scope: !114)
!121 = !DILocation(line: 69, column: 10, scope: !114)
!122 = !DILocalVariable(name: "data", scope: !123, file: !17, line: 71, type: !4)
!123 = distinct !DILexicalBlock(scope: !114, file: !17, line: 70, column: 5)
!124 = !DILocation(line: 71, column: 19, scope: !123)
!125 = !DILocation(line: 71, column: 27, scope: !123)
!126 = !DILocation(line: 71, column: 26, scope: !123)
!127 = !DILocation(line: 73, column: 27, scope: !123)
!128 = !DILocation(line: 73, column: 16, scope: !123)
!129 = !DILocation(line: 73, column: 14, scope: !123)
!130 = !DILocation(line: 74, column: 13, scope: !131)
!131 = distinct !DILexicalBlock(scope: !123, file: !17, line: 74, column: 13)
!132 = !DILocation(line: 74, column: 18, scope: !131)
!133 = !DILocation(line: 74, column: 13, scope: !123)
!134 = !DILocation(line: 74, column: 28, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !17, line: 74, column: 27)
!136 = !DILocation(line: 75, column: 21, scope: !123)
!137 = !DILocation(line: 75, column: 10, scope: !123)
!138 = !DILocation(line: 75, column: 19, scope: !123)
!139 = !DILocalVariable(name: "data", scope: !140, file: !17, line: 78, type: !4)
!140 = distinct !DILexicalBlock(scope: !114, file: !17, line: 77, column: 5)
!141 = !DILocation(line: 78, column: 19, scope: !140)
!142 = !DILocation(line: 78, column: 27, scope: !140)
!143 = !DILocation(line: 78, column: 26, scope: !140)
!144 = !DILocalVariable(name: "source", scope: !145, file: !17, line: 80, type: !52)
!145 = distinct !DILexicalBlock(scope: !140, file: !17, line: 79, column: 9)
!146 = !DILocation(line: 80, column: 21, scope: !145)
!147 = !DILocalVariable(name: "i", scope: !145, file: !17, line: 81, type: !57)
!148 = !DILocation(line: 81, column: 20, scope: !145)
!149 = !DILocalVariable(name: "sourceLen", scope: !145, file: !17, line: 81, type: !57)
!150 = !DILocation(line: 81, column: 23, scope: !145)
!151 = !DILocation(line: 82, column: 32, scope: !145)
!152 = !DILocation(line: 82, column: 25, scope: !145)
!153 = !DILocation(line: 82, column: 23, scope: !145)
!154 = !DILocation(line: 85, column: 20, scope: !155)
!155 = distinct !DILexicalBlock(scope: !145, file: !17, line: 85, column: 13)
!156 = !DILocation(line: 85, column: 18, scope: !155)
!157 = !DILocation(line: 85, column: 25, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !17, line: 85, column: 13)
!159 = !DILocation(line: 85, column: 29, scope: !158)
!160 = !DILocation(line: 85, column: 39, scope: !158)
!161 = !DILocation(line: 85, column: 27, scope: !158)
!162 = !DILocation(line: 85, column: 13, scope: !155)
!163 = !DILocation(line: 87, column: 34, scope: !164)
!164 = distinct !DILexicalBlock(scope: !158, file: !17, line: 86, column: 13)
!165 = !DILocation(line: 87, column: 27, scope: !164)
!166 = !DILocation(line: 87, column: 17, scope: !164)
!167 = !DILocation(line: 87, column: 22, scope: !164)
!168 = !DILocation(line: 87, column: 25, scope: !164)
!169 = !DILocation(line: 88, column: 13, scope: !164)
!170 = !DILocation(line: 85, column: 45, scope: !158)
!171 = !DILocation(line: 85, column: 13, scope: !158)
!172 = distinct !{!172, !162, !173, !85}
!173 = !DILocation(line: 88, column: 13, scope: !155)
!174 = !DILocation(line: 89, column: 24, scope: !145)
!175 = !DILocation(line: 89, column: 13, scope: !145)
!176 = !DILocation(line: 90, column: 18, scope: !145)
!177 = !DILocation(line: 90, column: 13, scope: !145)
!178 = !DILocation(line: 93, column: 1, scope: !114)
