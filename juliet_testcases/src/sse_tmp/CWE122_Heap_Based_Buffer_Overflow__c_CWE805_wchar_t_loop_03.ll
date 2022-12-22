; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_03.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_03_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call noalias align 16 i8* @malloc(i64 200) #5, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !47
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx2, align 4, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !53
  %cmp3 = icmp ult i64 %3, 100, !dbg !55
  br i1 %cmp3, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !59
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !59
  %6 = load i32*, i32** %data, align 8, !dbg !60
  %7 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !60
  store i32 %5, i32* %arrayidx5, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %8, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !69
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !69
  store i32 0, i32* %arrayidx6, align 4, !dbg !70
  %10 = load i32*, i32** %data, align 8, !dbg !71
  call void @printWLine(i32* %10), !dbg !72
  %11 = load i32*, i32** %data, align 8, !dbg !73
  %12 = bitcast i32* %11 to i8*, !dbg !73
  call void @free(i8* %12) #5, !dbg !74
  ret void, !dbg !75
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_03_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* null) #5, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #5, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_03_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_03_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i32* null, i32** %data, align 8, !dbg !103
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !104
  %0 = bitcast i8* %call to i32*, !dbg !107
  store i32* %0, i32** %data, align 8, !dbg !108
  %1 = load i32*, i32** %data, align 8, !dbg !109
  %cmp = icmp eq i32* %1, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata i64* %i, metadata !117, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !122
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !123
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx2, align 4, !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !129
  %cmp3 = icmp ult i64 %3, 100, !dbg !131
  br i1 %cmp3, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !135
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !135
  %6 = load i32*, i32** %data, align 8, !dbg !136
  %7 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !136
  store i32 %5, i32* %arrayidx5, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %8, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !144
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !144
  store i32 0, i32* %arrayidx6, align 4, !dbg !145
  %10 = load i32*, i32** %data, align 8, !dbg !146
  call void @printWLine(i32* %10), !dbg !147
  %11 = load i32*, i32** %data, align 8, !dbg !148
  %12 = bitcast i32* %11 to i8*, !dbg !148
  call void @free(i8* %12) #5, !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !152, metadata !DIExpression()), !dbg !153
  store i32* null, i32** %data, align 8, !dbg !154
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !155
  %0 = bitcast i8* %call to i32*, !dbg !158
  store i32* %0, i32** %data, align 8, !dbg !159
  %1 = load i32*, i32** %data, align 8, !dbg !160
  %cmp = icmp eq i32* %1, null, !dbg !162
  br i1 %cmp, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !164
  unreachable, !dbg !164

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !166
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !166
  store i32 0, i32* %arrayidx, align 4, !dbg !167
  call void @llvm.dbg.declare(metadata i64* %i, metadata !168, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !171, metadata !DIExpression()), !dbg !172
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !173
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !174
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !175
  store i32 0, i32* %arrayidx2, align 4, !dbg !176
  store i64 0, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !180
  %cmp3 = icmp ult i64 %3, 100, !dbg !182
  br i1 %cmp3, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !186
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !186
  %6 = load i32*, i32** %data, align 8, !dbg !187
  %7 = load i64, i64* %i, align 8, !dbg !188
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !187
  store i32 %5, i32* %arrayidx5, align 4, !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !191
  %inc = add i64 %8, 1, !dbg !191
  store i64 %inc, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !195
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !195
  store i32 0, i32* %arrayidx6, align 4, !dbg !196
  %10 = load i32*, i32** %data, align 8, !dbg !197
  call void @printWLine(i32* %10), !dbg !198
  %11 = load i32*, i32** %data, align 8, !dbg !199
  %12 = bitcast i32* %11 to i8*, !dbg !199
  call void @free(i8* %12) #5, !dbg !200
  ret void, !dbg !201
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_03.c", directory: "/root/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_03_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_03.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 30, column: 27, scope: !24)
!24 = distinct !DILexicalBlock(scope: !25, file: !17, line: 28, column: 5)
!25 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!26 = !DILocation(line: 30, column: 16, scope: !24)
!27 = !DILocation(line: 30, column: 14, scope: !24)
!28 = !DILocation(line: 31, column: 13, scope: !29)
!29 = distinct !DILexicalBlock(scope: !24, file: !17, line: 31, column: 13)
!30 = !DILocation(line: 31, column: 18, scope: !29)
!31 = !DILocation(line: 31, column: 13, scope: !24)
!32 = !DILocation(line: 31, column: 28, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !17, line: 31, column: 27)
!34 = !DILocation(line: 32, column: 9, scope: !24)
!35 = !DILocation(line: 32, column: 17, scope: !24)
!36 = !DILocalVariable(name: "i", scope: !37, file: !17, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !39)
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 35, column: 16, scope: !37)
!41 = !DILocalVariable(name: "source", scope: !37, file: !17, line: 36, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 36, column: 17, scope: !37)
!46 = !DILocation(line: 37, column: 17, scope: !37)
!47 = !DILocation(line: 37, column: 9, scope: !37)
!48 = !DILocation(line: 38, column: 9, scope: !37)
!49 = !DILocation(line: 38, column: 23, scope: !37)
!50 = !DILocation(line: 40, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !37, file: !17, line: 40, column: 9)
!52 = !DILocation(line: 40, column: 14, scope: !51)
!53 = !DILocation(line: 40, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !17, line: 40, column: 9)
!55 = !DILocation(line: 40, column: 23, scope: !54)
!56 = !DILocation(line: 40, column: 9, scope: !51)
!57 = !DILocation(line: 42, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !17, line: 41, column: 9)
!59 = !DILocation(line: 42, column: 23, scope: !58)
!60 = !DILocation(line: 42, column: 13, scope: !58)
!61 = !DILocation(line: 42, column: 18, scope: !58)
!62 = !DILocation(line: 42, column: 21, scope: !58)
!63 = !DILocation(line: 43, column: 9, scope: !58)
!64 = !DILocation(line: 40, column: 31, scope: !54)
!65 = !DILocation(line: 40, column: 9, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 43, column: 9, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 44, column: 9, scope: !37)
!70 = !DILocation(line: 44, column: 21, scope: !37)
!71 = !DILocation(line: 45, column: 20, scope: !37)
!72 = !DILocation(line: 45, column: 9, scope: !37)
!73 = !DILocation(line: 46, column: 14, scope: !37)
!74 = !DILocation(line: 46, column: 9, scope: !37)
!75 = !DILocation(line: 48, column: 1, scope: !16)
!76 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_03_good", scope: !17, file: !17, line: 115, type: !18, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocation(line: 117, column: 5, scope: !76)
!78 = !DILocation(line: 118, column: 5, scope: !76)
!79 = !DILocation(line: 119, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 131, type: !81, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!7, !7, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !17, line: 131, type: !7)
!87 = !DILocation(line: 131, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !17, line: 131, type: !83)
!89 = !DILocation(line: 131, column: 27, scope: !80)
!90 = !DILocation(line: 134, column: 22, scope: !80)
!91 = !DILocation(line: 134, column: 12, scope: !80)
!92 = !DILocation(line: 134, column: 5, scope: !80)
!93 = !DILocation(line: 136, column: 5, scope: !80)
!94 = !DILocation(line: 137, column: 5, scope: !80)
!95 = !DILocation(line: 138, column: 5, scope: !80)
!96 = !DILocation(line: 141, column: 5, scope: !80)
!97 = !DILocation(line: 142, column: 5, scope: !80)
!98 = !DILocation(line: 143, column: 5, scope: !80)
!99 = !DILocation(line: 145, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 55, type: !18, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !17, line: 57, type: !4)
!102 = !DILocation(line: 57, column: 15, scope: !100)
!103 = !DILocation(line: 58, column: 10, scope: !100)
!104 = !DILocation(line: 67, column: 27, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !17, line: 65, column: 5)
!106 = distinct !DILexicalBlock(scope: !100, file: !17, line: 59, column: 8)
!107 = !DILocation(line: 67, column: 16, scope: !105)
!108 = !DILocation(line: 67, column: 14, scope: !105)
!109 = !DILocation(line: 68, column: 13, scope: !110)
!110 = distinct !DILexicalBlock(scope: !105, file: !17, line: 68, column: 13)
!111 = !DILocation(line: 68, column: 18, scope: !110)
!112 = !DILocation(line: 68, column: 13, scope: !105)
!113 = !DILocation(line: 68, column: 28, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !17, line: 68, column: 27)
!115 = !DILocation(line: 69, column: 9, scope: !105)
!116 = !DILocation(line: 69, column: 17, scope: !105)
!117 = !DILocalVariable(name: "i", scope: !118, file: !17, line: 72, type: !38)
!118 = distinct !DILexicalBlock(scope: !100, file: !17, line: 71, column: 5)
!119 = !DILocation(line: 72, column: 16, scope: !118)
!120 = !DILocalVariable(name: "source", scope: !118, file: !17, line: 73, type: !42)
!121 = !DILocation(line: 73, column: 17, scope: !118)
!122 = !DILocation(line: 74, column: 17, scope: !118)
!123 = !DILocation(line: 74, column: 9, scope: !118)
!124 = !DILocation(line: 75, column: 9, scope: !118)
!125 = !DILocation(line: 75, column: 23, scope: !118)
!126 = !DILocation(line: 77, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !118, file: !17, line: 77, column: 9)
!128 = !DILocation(line: 77, column: 14, scope: !127)
!129 = !DILocation(line: 77, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !17, line: 77, column: 9)
!131 = !DILocation(line: 77, column: 23, scope: !130)
!132 = !DILocation(line: 77, column: 9, scope: !127)
!133 = !DILocation(line: 79, column: 30, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !17, line: 78, column: 9)
!135 = !DILocation(line: 79, column: 23, scope: !134)
!136 = !DILocation(line: 79, column: 13, scope: !134)
!137 = !DILocation(line: 79, column: 18, scope: !134)
!138 = !DILocation(line: 79, column: 21, scope: !134)
!139 = !DILocation(line: 80, column: 9, scope: !134)
!140 = !DILocation(line: 77, column: 31, scope: !130)
!141 = !DILocation(line: 77, column: 9, scope: !130)
!142 = distinct !{!142, !132, !143, !68}
!143 = !DILocation(line: 80, column: 9, scope: !127)
!144 = !DILocation(line: 81, column: 9, scope: !118)
!145 = !DILocation(line: 81, column: 21, scope: !118)
!146 = !DILocation(line: 82, column: 20, scope: !118)
!147 = !DILocation(line: 82, column: 9, scope: !118)
!148 = !DILocation(line: 83, column: 14, scope: !118)
!149 = !DILocation(line: 83, column: 9, scope: !118)
!150 = !DILocation(line: 85, column: 1, scope: !100)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 88, type: !18, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocalVariable(name: "data", scope: !151, file: !17, line: 90, type: !4)
!153 = !DILocation(line: 90, column: 15, scope: !151)
!154 = !DILocation(line: 91, column: 10, scope: !151)
!155 = !DILocation(line: 95, column: 27, scope: !156)
!156 = distinct !DILexicalBlock(scope: !157, file: !17, line: 93, column: 5)
!157 = distinct !DILexicalBlock(scope: !151, file: !17, line: 92, column: 8)
!158 = !DILocation(line: 95, column: 16, scope: !156)
!159 = !DILocation(line: 95, column: 14, scope: !156)
!160 = !DILocation(line: 96, column: 13, scope: !161)
!161 = distinct !DILexicalBlock(scope: !156, file: !17, line: 96, column: 13)
!162 = !DILocation(line: 96, column: 18, scope: !161)
!163 = !DILocation(line: 96, column: 13, scope: !156)
!164 = !DILocation(line: 96, column: 28, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !17, line: 96, column: 27)
!166 = !DILocation(line: 97, column: 9, scope: !156)
!167 = !DILocation(line: 97, column: 17, scope: !156)
!168 = !DILocalVariable(name: "i", scope: !169, file: !17, line: 100, type: !38)
!169 = distinct !DILexicalBlock(scope: !151, file: !17, line: 99, column: 5)
!170 = !DILocation(line: 100, column: 16, scope: !169)
!171 = !DILocalVariable(name: "source", scope: !169, file: !17, line: 101, type: !42)
!172 = !DILocation(line: 101, column: 17, scope: !169)
!173 = !DILocation(line: 102, column: 17, scope: !169)
!174 = !DILocation(line: 102, column: 9, scope: !169)
!175 = !DILocation(line: 103, column: 9, scope: !169)
!176 = !DILocation(line: 103, column: 23, scope: !169)
!177 = !DILocation(line: 105, column: 16, scope: !178)
!178 = distinct !DILexicalBlock(scope: !169, file: !17, line: 105, column: 9)
!179 = !DILocation(line: 105, column: 14, scope: !178)
!180 = !DILocation(line: 105, column: 21, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !17, line: 105, column: 9)
!182 = !DILocation(line: 105, column: 23, scope: !181)
!183 = !DILocation(line: 105, column: 9, scope: !178)
!184 = !DILocation(line: 107, column: 30, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !17, line: 106, column: 9)
!186 = !DILocation(line: 107, column: 23, scope: !185)
!187 = !DILocation(line: 107, column: 13, scope: !185)
!188 = !DILocation(line: 107, column: 18, scope: !185)
!189 = !DILocation(line: 107, column: 21, scope: !185)
!190 = !DILocation(line: 108, column: 9, scope: !185)
!191 = !DILocation(line: 105, column: 31, scope: !181)
!192 = !DILocation(line: 105, column: 9, scope: !181)
!193 = distinct !{!193, !183, !194, !68}
!194 = !DILocation(line: 108, column: 9, scope: !178)
!195 = !DILocation(line: 109, column: 9, scope: !169)
!196 = !DILocation(line: 109, column: 21, scope: !169)
!197 = !DILocation(line: 110, column: 20, scope: !169)
!198 = !DILocation(line: 110, column: 9, scope: !169)
!199 = !DILocation(line: 111, column: 14, scope: !169)
!200 = !DILocation(line: 111, column: 9, scope: !169)
!201 = !DILocation(line: 113, column: 1, scope: !151)
