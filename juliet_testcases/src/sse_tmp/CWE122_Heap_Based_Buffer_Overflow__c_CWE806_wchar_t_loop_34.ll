; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_unionType, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_unionType* %myUnion, metadata !22, metadata !DIExpression()), !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !29
  %0 = bitcast i8* %call to i32*, !dbg !30
  store i32* %0, i32** %data, align 8, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #7, !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %4 = load i32*, i32** %data, align 8, !dbg !42
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !43
  store i32* %4, i32** %unionFirst, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !48
  %5 = load i32*, i32** %unionSecond, align 8, !dbg !48
  store i32* %5, i32** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !54
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %i, metadata !55, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !59, metadata !DIExpression()), !dbg !60
  %7 = load i32*, i32** %data2, align 8, !dbg !61
  %call3 = call i64 @wcslen(i32* %7) #9, !dbg !62
  store i64 %call3, i64* %dataLen, align 8, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !67
  %9 = load i64, i64* %dataLen, align 8, !dbg !69
  %cmp4 = icmp ult i64 %8, %9, !dbg !70
  br i1 %cmp4, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data2, align 8, !dbg !72
  %11 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !72
  %12 = load i32, i32* %arrayidx5, align 4, !dbg !72
  %13 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !76
  store i32 %12, i32* %arrayidx6, align 4, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %14, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !84
  store i32 0, i32* %arrayidx7, align 4, !dbg !85
  %15 = load i32*, i32** %data2, align 8, !dbg !86
  call void @printWLine(i32* %15), !dbg !87
  %16 = load i32*, i32** %data2, align 8, !dbg !88
  %17 = bitcast i32* %16 to i8*, !dbg !88
  call void @free(i8* %17) #7, !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_good() #0 !dbg !91 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_good(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_bad(), !dbg !111
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
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_unionType, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_unionType* %myUnion, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !119
  %0 = bitcast i8* %call to i32*, !dbg !120
  store i32* %0, i32** %data, align 8, !dbg !121
  %1 = load i32*, i32** %data, align 8, !dbg !122
  %cmp = icmp eq i32* %1, null, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !128
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 49) #7, !dbg !129
  %3 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  %4 = load i32*, i32** %data, align 8, !dbg !132
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !133
  store i32* %4, i32** %unionFirst, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !135, metadata !DIExpression()), !dbg !137
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_unionType* %myUnion to i32**, !dbg !138
  %5 = load i32*, i32** %unionSecond, align 8, !dbg !138
  store i32* %5, i32** %data2, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !139, metadata !DIExpression()), !dbg !141
  %6 = bitcast [50 x i32]* %dest to i8*, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 200, i1 false), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %i, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !144, metadata !DIExpression()), !dbg !145
  %7 = load i32*, i32** %data2, align 8, !dbg !146
  %call3 = call i64 @wcslen(i32* %7) #9, !dbg !147
  store i64 %call3, i64* %dataLen, align 8, !dbg !148
  store i64 0, i64* %i, align 8, !dbg !149
  br label %for.cond, !dbg !151

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !152
  %9 = load i64, i64* %dataLen, align 8, !dbg !154
  %cmp4 = icmp ult i64 %8, %9, !dbg !155
  br i1 %cmp4, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data2, align 8, !dbg !157
  %11 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx5 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !157
  %12 = load i32, i32* %arrayidx5, align 4, !dbg !157
  %13 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %13, !dbg !161
  store i32 %12, i32* %arrayidx6, align 4, !dbg !162
  br label %for.inc, !dbg !163

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !164
  %inc = add i64 %14, 1, !dbg !164
  store i64 %inc, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !165, !llvm.loop !166

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !168
  store i32 0, i32* %arrayidx7, align 4, !dbg !169
  %15 = load i32*, i32** %data2, align 8, !dbg !170
  call void @printWLine(i32* %15), !dbg !171
  %16 = load i32*, i32** %data2, align 8, !dbg !172
  %17 = bitcast i32* %16 to i8*, !dbg !172
  call void @free(i8* %17) #7, !dbg !173
  ret void, !dbg !174
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_bad", scope: !17, file: !17, line: 29, type: !18, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 31, type: !4)
!21 = !DILocation(line: 31, column: 15, scope: !16)
!22 = !DILocalVariable(name: "myUnion", scope: !16, file: !17, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_unionType", file: !17, line: 25, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !17, line: 21, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !24, file: !17, line: 23, baseType: !4, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !24, file: !17, line: 24, baseType: !4, size: 64)
!28 = !DILocation(line: 32, column: 75, scope: !16)
!29 = !DILocation(line: 33, column: 23, scope: !16)
!30 = !DILocation(line: 33, column: 12, scope: !16)
!31 = !DILocation(line: 33, column: 10, scope: !16)
!32 = !DILocation(line: 34, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 9)
!34 = !DILocation(line: 34, column: 14, scope: !33)
!35 = !DILocation(line: 34, column: 9, scope: !16)
!36 = !DILocation(line: 34, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 34, column: 23)
!38 = !DILocation(line: 36, column: 13, scope: !16)
!39 = !DILocation(line: 36, column: 5, scope: !16)
!40 = !DILocation(line: 37, column: 5, scope: !16)
!41 = !DILocation(line: 37, column: 17, scope: !16)
!42 = !DILocation(line: 38, column: 26, scope: !16)
!43 = !DILocation(line: 38, column: 13, scope: !16)
!44 = !DILocation(line: 38, column: 24, scope: !16)
!45 = !DILocalVariable(name: "data", scope: !46, file: !17, line: 40, type: !4)
!46 = distinct !DILexicalBlock(scope: !16, file: !17, line: 39, column: 5)
!47 = !DILocation(line: 40, column: 19, scope: !46)
!48 = !DILocation(line: 40, column: 34, scope: !46)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !17, line: 42, type: !51)
!50 = distinct !DILexicalBlock(scope: !46, file: !17, line: 41, column: 9)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 50)
!54 = !DILocation(line: 42, column: 21, scope: !50)
!55 = !DILocalVariable(name: "i", scope: !50, file: !17, line: 43, type: !56)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !57)
!57 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 43, column: 20, scope: !50)
!59 = !DILocalVariable(name: "dataLen", scope: !50, file: !17, line: 43, type: !56)
!60 = !DILocation(line: 43, column: 23, scope: !50)
!61 = !DILocation(line: 44, column: 30, scope: !50)
!62 = !DILocation(line: 44, column: 23, scope: !50)
!63 = !DILocation(line: 44, column: 21, scope: !50)
!64 = !DILocation(line: 46, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !50, file: !17, line: 46, column: 13)
!66 = !DILocation(line: 46, column: 18, scope: !65)
!67 = !DILocation(line: 46, column: 25, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !17, line: 46, column: 13)
!69 = !DILocation(line: 46, column: 29, scope: !68)
!70 = !DILocation(line: 46, column: 27, scope: !68)
!71 = !DILocation(line: 46, column: 13, scope: !65)
!72 = !DILocation(line: 48, column: 27, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !17, line: 47, column: 13)
!74 = !DILocation(line: 48, column: 32, scope: !73)
!75 = !DILocation(line: 48, column: 22, scope: !73)
!76 = !DILocation(line: 48, column: 17, scope: !73)
!77 = !DILocation(line: 48, column: 25, scope: !73)
!78 = !DILocation(line: 49, column: 13, scope: !73)
!79 = !DILocation(line: 46, column: 39, scope: !68)
!80 = !DILocation(line: 46, column: 13, scope: !68)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 49, column: 13, scope: !65)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 50, column: 13, scope: !50)
!85 = !DILocation(line: 50, column: 24, scope: !50)
!86 = !DILocation(line: 51, column: 24, scope: !50)
!87 = !DILocation(line: 51, column: 13, scope: !50)
!88 = !DILocation(line: 52, column: 18, scope: !50)
!89 = !DILocation(line: 52, column: 13, scope: !50)
!90 = !DILocation(line: 55, column: 1, scope: !16)
!91 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_34_good", scope: !17, file: !17, line: 90, type: !18, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 92, column: 5, scope: !91)
!93 = !DILocation(line: 93, column: 1, scope: !91)
!94 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 104, type: !95, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DISubroutineType(types: !96)
!96 = !{!7, !7, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !17, line: 104, type: !7)
!101 = !DILocation(line: 104, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !17, line: 104, type: !97)
!103 = !DILocation(line: 104, column: 27, scope: !94)
!104 = !DILocation(line: 107, column: 22, scope: !94)
!105 = !DILocation(line: 107, column: 12, scope: !94)
!106 = !DILocation(line: 107, column: 5, scope: !94)
!107 = !DILocation(line: 109, column: 5, scope: !94)
!108 = !DILocation(line: 110, column: 5, scope: !94)
!109 = !DILocation(line: 111, column: 5, scope: !94)
!110 = !DILocation(line: 114, column: 5, scope: !94)
!111 = !DILocation(line: 115, column: 5, scope: !94)
!112 = !DILocation(line: 116, column: 5, scope: !94)
!113 = !DILocation(line: 118, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 62, type: !18, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !17, line: 64, type: !4)
!116 = !DILocation(line: 64, column: 15, scope: !114)
!117 = !DILocalVariable(name: "myUnion", scope: !114, file: !17, line: 65, type: !23)
!118 = !DILocation(line: 65, column: 75, scope: !114)
!119 = !DILocation(line: 66, column: 23, scope: !114)
!120 = !DILocation(line: 66, column: 12, scope: !114)
!121 = !DILocation(line: 66, column: 10, scope: !114)
!122 = !DILocation(line: 67, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !114, file: !17, line: 67, column: 9)
!124 = !DILocation(line: 67, column: 14, scope: !123)
!125 = !DILocation(line: 67, column: 9, scope: !114)
!126 = !DILocation(line: 67, column: 24, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !17, line: 67, column: 23)
!128 = !DILocation(line: 69, column: 13, scope: !114)
!129 = !DILocation(line: 69, column: 5, scope: !114)
!130 = !DILocation(line: 70, column: 5, scope: !114)
!131 = !DILocation(line: 70, column: 16, scope: !114)
!132 = !DILocation(line: 71, column: 26, scope: !114)
!133 = !DILocation(line: 71, column: 13, scope: !114)
!134 = !DILocation(line: 71, column: 24, scope: !114)
!135 = !DILocalVariable(name: "data", scope: !136, file: !17, line: 73, type: !4)
!136 = distinct !DILexicalBlock(scope: !114, file: !17, line: 72, column: 5)
!137 = !DILocation(line: 73, column: 19, scope: !136)
!138 = !DILocation(line: 73, column: 34, scope: !136)
!139 = !DILocalVariable(name: "dest", scope: !140, file: !17, line: 75, type: !51)
!140 = distinct !DILexicalBlock(scope: !136, file: !17, line: 74, column: 9)
!141 = !DILocation(line: 75, column: 21, scope: !140)
!142 = !DILocalVariable(name: "i", scope: !140, file: !17, line: 76, type: !56)
!143 = !DILocation(line: 76, column: 20, scope: !140)
!144 = !DILocalVariable(name: "dataLen", scope: !140, file: !17, line: 76, type: !56)
!145 = !DILocation(line: 76, column: 23, scope: !140)
!146 = !DILocation(line: 77, column: 30, scope: !140)
!147 = !DILocation(line: 77, column: 23, scope: !140)
!148 = !DILocation(line: 77, column: 21, scope: !140)
!149 = !DILocation(line: 79, column: 20, scope: !150)
!150 = distinct !DILexicalBlock(scope: !140, file: !17, line: 79, column: 13)
!151 = !DILocation(line: 79, column: 18, scope: !150)
!152 = !DILocation(line: 79, column: 25, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !17, line: 79, column: 13)
!154 = !DILocation(line: 79, column: 29, scope: !153)
!155 = !DILocation(line: 79, column: 27, scope: !153)
!156 = !DILocation(line: 79, column: 13, scope: !150)
!157 = !DILocation(line: 81, column: 27, scope: !158)
!158 = distinct !DILexicalBlock(scope: !153, file: !17, line: 80, column: 13)
!159 = !DILocation(line: 81, column: 32, scope: !158)
!160 = !DILocation(line: 81, column: 22, scope: !158)
!161 = !DILocation(line: 81, column: 17, scope: !158)
!162 = !DILocation(line: 81, column: 25, scope: !158)
!163 = !DILocation(line: 82, column: 13, scope: !158)
!164 = !DILocation(line: 79, column: 39, scope: !153)
!165 = !DILocation(line: 79, column: 13, scope: !153)
!166 = distinct !{!166, !156, !167, !83}
!167 = !DILocation(line: 82, column: 13, scope: !150)
!168 = !DILocation(line: 83, column: 13, scope: !140)
!169 = !DILocation(line: 83, column: 24, scope: !140)
!170 = !DILocation(line: 84, column: 24, scope: !140)
!171 = !DILocation(line: 84, column: 13, scope: !140)
!172 = !DILocation(line: 85, column: 18, scope: !140)
!173 = !DILocation(line: 85, column: 13, scope: !140)
!174 = !DILocation(line: 88, column: 1, scope: !114)
