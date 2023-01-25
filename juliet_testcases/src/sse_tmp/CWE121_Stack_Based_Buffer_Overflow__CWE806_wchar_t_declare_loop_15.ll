; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_15.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  store i32* %arraydecay, i32** %data, align 8, !dbg !27
  %0 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !30
  store i32 0, i32* %arrayidx, align 4, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !42, metadata !DIExpression()), !dbg !43
  %3 = load i32*, i32** %data, align 8, !dbg !44
  %call1 = call i64 @wcslen(i32* %3) #7, !dbg !45
  store i64 %call1, i64* %dataLen, align 8, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !50
  %5 = load i64, i64* %dataLen, align 8, !dbg !52
  %cmp = icmp ult i64 %4, %5, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !55
  %7 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !55
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !55
  %9 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !59
  store i32 %8, i32* %arrayidx3, align 4, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %10, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !67
  store i32 0, i32* %arrayidx4, align 4, !dbg !68
  %11 = load i32*, i32** %data, align 8, !dbg !69
  call void @printWLine(i32* %11), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_15_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #6, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #6, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_15_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_15_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !101
  store i32* %arraydecay, i32** %data, align 8, !dbg !102
  %0 = load i32*, i32** %data, align 8, !dbg !103
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !104
  %1 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !112, metadata !DIExpression()), !dbg !113
  %3 = load i32*, i32** %data, align 8, !dbg !114
  %call1 = call i64 @wcslen(i32* %3) #7, !dbg !115
  store i64 %call1, i64* %dataLen, align 8, !dbg !116
  store i64 0, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !120
  %5 = load i64, i64* %dataLen, align 8, !dbg !122
  %cmp = icmp ult i64 %4, %5, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !125
  %7 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !125
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !125
  %9 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !129
  store i32 %8, i32* %arrayidx3, align 4, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %10, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !136
  store i32 0, i32* %arrayidx4, align 4, !dbg !137
  %11 = load i32*, i32** %data, align 8, !dbg !138
  call void @printWLine(i32* %11), !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !141 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !146
  store i32* %arraydecay, i32** %data, align 8, !dbg !147
  %0 = load i32*, i32** %data, align 8, !dbg !148
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !149
  %1 = load i32*, i32** %data, align 8, !dbg !150
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !150
  store i32 0, i32* %arrayidx, align 4, !dbg !151
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !152, metadata !DIExpression()), !dbg !154
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !154
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !154
  call void @llvm.dbg.declare(metadata i64* %i, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !157, metadata !DIExpression()), !dbg !158
  %3 = load i32*, i32** %data, align 8, !dbg !159
  %call1 = call i64 @wcslen(i32* %3) #7, !dbg !160
  store i64 %call1, i64* %dataLen, align 8, !dbg !161
  store i64 0, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !164

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !165
  %5 = load i64, i64* %dataLen, align 8, !dbg !167
  %cmp = icmp ult i64 %4, %5, !dbg !168
  br i1 %cmp, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !170
  %7 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !170
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !170
  %9 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !174
  store i32 %8, i32* %arrayidx3, align 4, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %10, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !181
  store i32 0, i32* %arrayidx4, align 4, !dbg !182
  %11 = load i32*, i32** %data, align 8, !dbg !183
  call void @printWLine(i32* %11), !dbg !184
  ret void, !dbg !185
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_15.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 12, scope: !11)
!27 = !DILocation(line: 27, column: 10, scope: !11)
!28 = !DILocation(line: 32, column: 17, scope: !11)
!29 = !DILocation(line: 32, column: 9, scope: !11)
!30 = !DILocation(line: 33, column: 9, scope: !11)
!31 = !DILocation(line: 33, column: 21, scope: !11)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !12, line: 41, type: !34)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 41, column: 17, scope: !33)
!38 = !DILocalVariable(name: "i", scope: !33, file: !12, line: 42, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !40)
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 42, column: 16, scope: !33)
!42 = !DILocalVariable(name: "dataLen", scope: !33, file: !12, line: 42, type: !39)
!43 = !DILocation(line: 42, column: 19, scope: !33)
!44 = !DILocation(line: 43, column: 26, scope: !33)
!45 = !DILocation(line: 43, column: 19, scope: !33)
!46 = !DILocation(line: 43, column: 17, scope: !33)
!47 = !DILocation(line: 45, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !33, file: !12, line: 45, column: 9)
!49 = !DILocation(line: 45, column: 14, scope: !48)
!50 = !DILocation(line: 45, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !12, line: 45, column: 9)
!52 = !DILocation(line: 45, column: 25, scope: !51)
!53 = !DILocation(line: 45, column: 23, scope: !51)
!54 = !DILocation(line: 45, column: 9, scope: !48)
!55 = !DILocation(line: 47, column: 23, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !12, line: 46, column: 9)
!57 = !DILocation(line: 47, column: 28, scope: !56)
!58 = !DILocation(line: 47, column: 18, scope: !56)
!59 = !DILocation(line: 47, column: 13, scope: !56)
!60 = !DILocation(line: 47, column: 21, scope: !56)
!61 = !DILocation(line: 48, column: 9, scope: !56)
!62 = !DILocation(line: 45, column: 35, scope: !51)
!63 = !DILocation(line: 45, column: 9, scope: !51)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 48, column: 9, scope: !48)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 49, column: 9, scope: !33)
!68 = !DILocation(line: 49, column: 20, scope: !33)
!69 = !DILocation(line: 50, column: 20, scope: !33)
!70 = !DILocation(line: 50, column: 9, scope: !33)
!71 = !DILocation(line: 52, column: 1, scope: !11)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_15_good", scope: !12, file: !12, line: 122, type: !13, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 124, column: 5, scope: !72)
!74 = !DILocation(line: 125, column: 5, scope: !72)
!75 = !DILocation(line: 126, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 138, type: !77, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!19, !19, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 138, type: !19)
!83 = !DILocation(line: 138, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 138, type: !79)
!85 = !DILocation(line: 138, column: 27, scope: !76)
!86 = !DILocation(line: 141, column: 22, scope: !76)
!87 = !DILocation(line: 141, column: 12, scope: !76)
!88 = !DILocation(line: 141, column: 5, scope: !76)
!89 = !DILocation(line: 143, column: 5, scope: !76)
!90 = !DILocation(line: 144, column: 5, scope: !76)
!91 = !DILocation(line: 145, column: 5, scope: !76)
!92 = !DILocation(line: 148, column: 5, scope: !76)
!93 = !DILocation(line: 149, column: 5, scope: !76)
!94 = !DILocation(line: 150, column: 5, scope: !76)
!95 = !DILocation(line: 152, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 61, type: !16)
!98 = !DILocation(line: 61, column: 15, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !12, line: 62, type: !22)
!100 = !DILocation(line: 62, column: 13, scope: !96)
!101 = !DILocation(line: 63, column: 12, scope: !96)
!102 = !DILocation(line: 63, column: 10, scope: !96)
!103 = !DILocation(line: 72, column: 17, scope: !96)
!104 = !DILocation(line: 72, column: 9, scope: !96)
!105 = !DILocation(line: 73, column: 9, scope: !96)
!106 = !DILocation(line: 73, column: 20, scope: !96)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !12, line: 77, type: !34)
!108 = distinct !DILexicalBlock(scope: !96, file: !12, line: 76, column: 5)
!109 = !DILocation(line: 77, column: 17, scope: !108)
!110 = !DILocalVariable(name: "i", scope: !108, file: !12, line: 78, type: !39)
!111 = !DILocation(line: 78, column: 16, scope: !108)
!112 = !DILocalVariable(name: "dataLen", scope: !108, file: !12, line: 78, type: !39)
!113 = !DILocation(line: 78, column: 19, scope: !108)
!114 = !DILocation(line: 79, column: 26, scope: !108)
!115 = !DILocation(line: 79, column: 19, scope: !108)
!116 = !DILocation(line: 79, column: 17, scope: !108)
!117 = !DILocation(line: 81, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !108, file: !12, line: 81, column: 9)
!119 = !DILocation(line: 81, column: 14, scope: !118)
!120 = !DILocation(line: 81, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 81, column: 9)
!122 = !DILocation(line: 81, column: 25, scope: !121)
!123 = !DILocation(line: 81, column: 23, scope: !121)
!124 = !DILocation(line: 81, column: 9, scope: !118)
!125 = !DILocation(line: 83, column: 23, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !12, line: 82, column: 9)
!127 = !DILocation(line: 83, column: 28, scope: !126)
!128 = !DILocation(line: 83, column: 18, scope: !126)
!129 = !DILocation(line: 83, column: 13, scope: !126)
!130 = !DILocation(line: 83, column: 21, scope: !126)
!131 = !DILocation(line: 84, column: 9, scope: !126)
!132 = !DILocation(line: 81, column: 35, scope: !121)
!133 = !DILocation(line: 81, column: 9, scope: !121)
!134 = distinct !{!134, !124, !135, !66}
!135 = !DILocation(line: 84, column: 9, scope: !118)
!136 = !DILocation(line: 85, column: 9, scope: !108)
!137 = !DILocation(line: 85, column: 20, scope: !108)
!138 = !DILocation(line: 86, column: 20, scope: !108)
!139 = !DILocation(line: 86, column: 9, scope: !108)
!140 = !DILocation(line: 88, column: 1, scope: !96)
!141 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", scope: !141, file: !12, line: 93, type: !16)
!143 = !DILocation(line: 93, column: 15, scope: !141)
!144 = !DILocalVariable(name: "dataBuffer", scope: !141, file: !12, line: 94, type: !22)
!145 = !DILocation(line: 94, column: 13, scope: !141)
!146 = !DILocation(line: 95, column: 12, scope: !141)
!147 = !DILocation(line: 95, column: 10, scope: !141)
!148 = !DILocation(line: 100, column: 17, scope: !141)
!149 = !DILocation(line: 100, column: 9, scope: !141)
!150 = !DILocation(line: 101, column: 9, scope: !141)
!151 = !DILocation(line: 101, column: 20, scope: !141)
!152 = !DILocalVariable(name: "dest", scope: !153, file: !12, line: 109, type: !34)
!153 = distinct !DILexicalBlock(scope: !141, file: !12, line: 108, column: 5)
!154 = !DILocation(line: 109, column: 17, scope: !153)
!155 = !DILocalVariable(name: "i", scope: !153, file: !12, line: 110, type: !39)
!156 = !DILocation(line: 110, column: 16, scope: !153)
!157 = !DILocalVariable(name: "dataLen", scope: !153, file: !12, line: 110, type: !39)
!158 = !DILocation(line: 110, column: 19, scope: !153)
!159 = !DILocation(line: 111, column: 26, scope: !153)
!160 = !DILocation(line: 111, column: 19, scope: !153)
!161 = !DILocation(line: 111, column: 17, scope: !153)
!162 = !DILocation(line: 113, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !153, file: !12, line: 113, column: 9)
!164 = !DILocation(line: 113, column: 14, scope: !163)
!165 = !DILocation(line: 113, column: 21, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !12, line: 113, column: 9)
!167 = !DILocation(line: 113, column: 25, scope: !166)
!168 = !DILocation(line: 113, column: 23, scope: !166)
!169 = !DILocation(line: 113, column: 9, scope: !163)
!170 = !DILocation(line: 115, column: 23, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !12, line: 114, column: 9)
!172 = !DILocation(line: 115, column: 28, scope: !171)
!173 = !DILocation(line: 115, column: 18, scope: !171)
!174 = !DILocation(line: 115, column: 13, scope: !171)
!175 = !DILocation(line: 115, column: 21, scope: !171)
!176 = !DILocation(line: 116, column: 9, scope: !171)
!177 = !DILocation(line: 113, column: 35, scope: !166)
!178 = !DILocation(line: 113, column: 9, scope: !166)
!179 = distinct !{!179, !169, !180, !66}
!180 = !DILocation(line: 116, column: 9, scope: !163)
!181 = !DILocation(line: 117, column: 9, scope: !153)
!182 = !DILocation(line: 117, column: 20, scope: !153)
!183 = !DILocation(line: 118, column: 20, scope: !153)
!184 = !DILocation(line: 118, column: 9, scope: !153)
!185 = !DILocation(line: 120, column: 1, scope: !141)
