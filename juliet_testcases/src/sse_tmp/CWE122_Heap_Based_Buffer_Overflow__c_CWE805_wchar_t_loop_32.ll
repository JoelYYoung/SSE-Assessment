; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_32.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_32_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
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
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !33
  %2 = bitcast i8* %call to i32*, !dbg !34
  store i32* %2, i32** %data1, align 8, !dbg !35
  %3 = load i32*, i32** %data1, align 8, !dbg !36
  %cmp = icmp eq i32* %3, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  %5 = load i32*, i32** %data1, align 8, !dbg !44
  %6 = load i32**, i32*** %dataPtr1, align 8, !dbg !45
  store i32* %5, i32** %6, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !47, metadata !DIExpression()), !dbg !49
  %7 = load i32**, i32*** %dataPtr2, align 8, !dbg !50
  %8 = load i32*, i32** %7, align 8, !dbg !51
  store i32* %8, i32** %data2, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !57, metadata !DIExpression()), !dbg !61
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !62
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !63
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !64
  store i32 0, i32* %arrayidx4, align 4, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !69
  %cmp5 = icmp ult i64 %9, 100, !dbg !71
  br i1 %cmp5, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %10, !dbg !75
  %11 = load i32, i32* %arrayidx6, align 4, !dbg !75
  %12 = load i32*, i32** %data2, align 8, !dbg !76
  %13 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !76
  store i32 %11, i32* %arrayidx7, align 4, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %14, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data2, align 8, !dbg !85
  %arrayidx8 = getelementptr inbounds i32, i32* %15, i64 99, !dbg !85
  store i32 0, i32* %arrayidx8, align 4, !dbg !86
  %16 = load i32*, i32** %data2, align 8, !dbg !87
  call void @printWLine(i32* %16), !dbg !88
  %17 = load i32*, i32** %data2, align 8, !dbg !89
  %18 = bitcast i32* %17 to i8*, !dbg !89
  call void @free(i8* %18) #5, !dbg !90
  ret void, !dbg !91
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_32_good() #0 !dbg !92 {
entry:
  call void @goodG2B(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #5, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #5, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_32_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_32_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !118, metadata !DIExpression()), !dbg !119
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !120, metadata !DIExpression()), !dbg !121
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !121
  store i32* null, i32** %data, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !123, metadata !DIExpression()), !dbg !125
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !126
  %1 = load i32*, i32** %0, align 8, !dbg !127
  store i32* %1, i32** %data1, align 8, !dbg !125
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !128
  %2 = bitcast i8* %call to i32*, !dbg !129
  store i32* %2, i32** %data1, align 8, !dbg !130
  %3 = load i32*, i32** %data1, align 8, !dbg !131
  %cmp = icmp eq i32* %3, null, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !135
  unreachable, !dbg !135

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !137
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !137
  store i32 0, i32* %arrayidx, align 4, !dbg !138
  %5 = load i32*, i32** %data1, align 8, !dbg !139
  %6 = load i32**, i32*** %dataPtr1, align 8, !dbg !140
  store i32* %5, i32** %6, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !142, metadata !DIExpression()), !dbg !144
  %7 = load i32**, i32*** %dataPtr2, align 8, !dbg !145
  %8 = load i32*, i32** %7, align 8, !dbg !146
  store i32* %8, i32** %data2, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata i64* %i, metadata !147, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !150, metadata !DIExpression()), !dbg !151
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !152
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !153
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !154
  store i32 0, i32* %arrayidx4, align 4, !dbg !155
  store i64 0, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !158

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !159
  %cmp5 = icmp ult i64 %9, 100, !dbg !161
  br i1 %cmp5, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %10, !dbg !165
  %11 = load i32, i32* %arrayidx6, align 4, !dbg !165
  %12 = load i32*, i32** %data2, align 8, !dbg !166
  %13 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !166
  store i32 %11, i32* %arrayidx7, align 4, !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !170
  %inc = add i64 %14, 1, !dbg !170
  store i64 %inc, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data2, align 8, !dbg !174
  %arrayidx8 = getelementptr inbounds i32, i32* %15, i64 99, !dbg !174
  store i32 0, i32* %arrayidx8, align 4, !dbg !175
  %16 = load i32*, i32** %data2, align 8, !dbg !176
  call void @printWLine(i32* %16), !dbg !177
  %17 = load i32*, i32** %data2, align 8, !dbg !178
  %18 = bitcast i32* %17 to i8*, !dbg !178
  call void @free(i8* %18) #5, !dbg !179
  ret void, !dbg !180
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_32.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_32_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_32.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocalVariable(name: "dataPtr1", scope: !16, file: !17, line: 26, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!24 = !DILocation(line: 26, column: 16, scope: !16)
!25 = !DILocalVariable(name: "dataPtr2", scope: !16, file: !17, line: 27, type: !23)
!26 = !DILocation(line: 27, column: 16, scope: !16)
!27 = !DILocation(line: 28, column: 10, scope: !16)
!28 = !DILocalVariable(name: "data", scope: !29, file: !17, line: 30, type: !4)
!29 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 5)
!30 = !DILocation(line: 30, column: 19, scope: !29)
!31 = !DILocation(line: 30, column: 27, scope: !29)
!32 = !DILocation(line: 30, column: 26, scope: !29)
!33 = !DILocation(line: 32, column: 27, scope: !29)
!34 = !DILocation(line: 32, column: 16, scope: !29)
!35 = !DILocation(line: 32, column: 14, scope: !29)
!36 = !DILocation(line: 33, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !17, line: 33, column: 13)
!38 = !DILocation(line: 33, column: 18, scope: !37)
!39 = !DILocation(line: 33, column: 13, scope: !29)
!40 = !DILocation(line: 33, column: 28, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !17, line: 33, column: 27)
!42 = !DILocation(line: 34, column: 9, scope: !29)
!43 = !DILocation(line: 34, column: 17, scope: !29)
!44 = !DILocation(line: 35, column: 21, scope: !29)
!45 = !DILocation(line: 35, column: 10, scope: !29)
!46 = !DILocation(line: 35, column: 19, scope: !29)
!47 = !DILocalVariable(name: "data", scope: !48, file: !17, line: 38, type: !4)
!48 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!49 = !DILocation(line: 38, column: 19, scope: !48)
!50 = !DILocation(line: 38, column: 27, scope: !48)
!51 = !DILocation(line: 38, column: 26, scope: !48)
!52 = !DILocalVariable(name: "i", scope: !53, file: !17, line: 40, type: !54)
!53 = distinct !DILexicalBlock(scope: !48, file: !17, line: 39, column: 9)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !55)
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 40, column: 20, scope: !53)
!57 = !DILocalVariable(name: "source", scope: !53, file: !17, line: 41, type: !58)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 100)
!61 = !DILocation(line: 41, column: 21, scope: !53)
!62 = !DILocation(line: 42, column: 21, scope: !53)
!63 = !DILocation(line: 42, column: 13, scope: !53)
!64 = !DILocation(line: 43, column: 13, scope: !53)
!65 = !DILocation(line: 43, column: 27, scope: !53)
!66 = !DILocation(line: 45, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !53, file: !17, line: 45, column: 13)
!68 = !DILocation(line: 45, column: 18, scope: !67)
!69 = !DILocation(line: 45, column: 25, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !17, line: 45, column: 13)
!71 = !DILocation(line: 45, column: 27, scope: !70)
!72 = !DILocation(line: 45, column: 13, scope: !67)
!73 = !DILocation(line: 47, column: 34, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !17, line: 46, column: 13)
!75 = !DILocation(line: 47, column: 27, scope: !74)
!76 = !DILocation(line: 47, column: 17, scope: !74)
!77 = !DILocation(line: 47, column: 22, scope: !74)
!78 = !DILocation(line: 47, column: 25, scope: !74)
!79 = !DILocation(line: 48, column: 13, scope: !74)
!80 = !DILocation(line: 45, column: 35, scope: !70)
!81 = !DILocation(line: 45, column: 13, scope: !70)
!82 = distinct !{!82, !72, !83, !84}
!83 = !DILocation(line: 48, column: 13, scope: !67)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 49, column: 13, scope: !53)
!86 = !DILocation(line: 49, column: 25, scope: !53)
!87 = !DILocation(line: 50, column: 24, scope: !53)
!88 = !DILocation(line: 50, column: 13, scope: !53)
!89 = !DILocation(line: 51, column: 18, scope: !53)
!90 = !DILocation(line: 51, column: 13, scope: !53)
!91 = !DILocation(line: 54, column: 1, scope: !16)
!92 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_32_good", scope: !17, file: !17, line: 94, type: !18, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 96, column: 5, scope: !92)
!94 = !DILocation(line: 97, column: 1, scope: !92)
!95 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 108, type: !96, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!7, !7, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !17, line: 108, type: !7)
!102 = !DILocation(line: 108, column: 14, scope: !95)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !17, line: 108, type: !98)
!104 = !DILocation(line: 108, column: 27, scope: !95)
!105 = !DILocation(line: 111, column: 22, scope: !95)
!106 = !DILocation(line: 111, column: 12, scope: !95)
!107 = !DILocation(line: 111, column: 5, scope: !95)
!108 = !DILocation(line: 113, column: 5, scope: !95)
!109 = !DILocation(line: 114, column: 5, scope: !95)
!110 = !DILocation(line: 115, column: 5, scope: !95)
!111 = !DILocation(line: 118, column: 5, scope: !95)
!112 = !DILocation(line: 119, column: 5, scope: !95)
!113 = !DILocation(line: 120, column: 5, scope: !95)
!114 = !DILocation(line: 122, column: 5, scope: !95)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 61, type: !18, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "data", scope: !115, file: !17, line: 63, type: !4)
!117 = !DILocation(line: 63, column: 15, scope: !115)
!118 = !DILocalVariable(name: "dataPtr1", scope: !115, file: !17, line: 64, type: !23)
!119 = !DILocation(line: 64, column: 16, scope: !115)
!120 = !DILocalVariable(name: "dataPtr2", scope: !115, file: !17, line: 65, type: !23)
!121 = !DILocation(line: 65, column: 16, scope: !115)
!122 = !DILocation(line: 66, column: 10, scope: !115)
!123 = !DILocalVariable(name: "data", scope: !124, file: !17, line: 68, type: !4)
!124 = distinct !DILexicalBlock(scope: !115, file: !17, line: 67, column: 5)
!125 = !DILocation(line: 68, column: 19, scope: !124)
!126 = !DILocation(line: 68, column: 27, scope: !124)
!127 = !DILocation(line: 68, column: 26, scope: !124)
!128 = !DILocation(line: 70, column: 27, scope: !124)
!129 = !DILocation(line: 70, column: 16, scope: !124)
!130 = !DILocation(line: 70, column: 14, scope: !124)
!131 = !DILocation(line: 71, column: 13, scope: !132)
!132 = distinct !DILexicalBlock(scope: !124, file: !17, line: 71, column: 13)
!133 = !DILocation(line: 71, column: 18, scope: !132)
!134 = !DILocation(line: 71, column: 13, scope: !124)
!135 = !DILocation(line: 71, column: 28, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !17, line: 71, column: 27)
!137 = !DILocation(line: 72, column: 9, scope: !124)
!138 = !DILocation(line: 72, column: 17, scope: !124)
!139 = !DILocation(line: 73, column: 21, scope: !124)
!140 = !DILocation(line: 73, column: 10, scope: !124)
!141 = !DILocation(line: 73, column: 19, scope: !124)
!142 = !DILocalVariable(name: "data", scope: !143, file: !17, line: 76, type: !4)
!143 = distinct !DILexicalBlock(scope: !115, file: !17, line: 75, column: 5)
!144 = !DILocation(line: 76, column: 19, scope: !143)
!145 = !DILocation(line: 76, column: 27, scope: !143)
!146 = !DILocation(line: 76, column: 26, scope: !143)
!147 = !DILocalVariable(name: "i", scope: !148, file: !17, line: 78, type: !54)
!148 = distinct !DILexicalBlock(scope: !143, file: !17, line: 77, column: 9)
!149 = !DILocation(line: 78, column: 20, scope: !148)
!150 = !DILocalVariable(name: "source", scope: !148, file: !17, line: 79, type: !58)
!151 = !DILocation(line: 79, column: 21, scope: !148)
!152 = !DILocation(line: 80, column: 21, scope: !148)
!153 = !DILocation(line: 80, column: 13, scope: !148)
!154 = !DILocation(line: 81, column: 13, scope: !148)
!155 = !DILocation(line: 81, column: 27, scope: !148)
!156 = !DILocation(line: 83, column: 20, scope: !157)
!157 = distinct !DILexicalBlock(scope: !148, file: !17, line: 83, column: 13)
!158 = !DILocation(line: 83, column: 18, scope: !157)
!159 = !DILocation(line: 83, column: 25, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !17, line: 83, column: 13)
!161 = !DILocation(line: 83, column: 27, scope: !160)
!162 = !DILocation(line: 83, column: 13, scope: !157)
!163 = !DILocation(line: 85, column: 34, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !17, line: 84, column: 13)
!165 = !DILocation(line: 85, column: 27, scope: !164)
!166 = !DILocation(line: 85, column: 17, scope: !164)
!167 = !DILocation(line: 85, column: 22, scope: !164)
!168 = !DILocation(line: 85, column: 25, scope: !164)
!169 = !DILocation(line: 86, column: 13, scope: !164)
!170 = !DILocation(line: 83, column: 35, scope: !160)
!171 = !DILocation(line: 83, column: 13, scope: !160)
!172 = distinct !{!172, !162, !173, !84}
!173 = !DILocation(line: 86, column: 13, scope: !157)
!174 = !DILocation(line: 87, column: 13, scope: !148)
!175 = !DILocation(line: 87, column: 25, scope: !148)
!176 = !DILocation(line: 88, column: 24, scope: !148)
!177 = !DILocation(line: 88, column: 13, scope: !148)
!178 = !DILocation(line: 89, column: 18, scope: !148)
!179 = !DILocation(line: 89, column: 13, scope: !148)
!180 = !DILocation(line: 92, column: 1, scope: !115)
