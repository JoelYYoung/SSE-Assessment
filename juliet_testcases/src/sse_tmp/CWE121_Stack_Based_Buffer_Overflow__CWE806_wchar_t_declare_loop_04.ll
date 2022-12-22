; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04_bad() #0 !dbg !11 {
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
  %call = call i32* @wmemset(i32* %0, i32 65, i64 99) #6, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !44, metadata !DIExpression()), !dbg !45
  %3 = load i32*, i32** %data, align 8, !dbg !46
  %call1 = call i64 @wcslen(i32* %3) #7, !dbg !47
  store i64 %call1, i64* %dataLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !52
  %5 = load i64, i64* %dataLen, align 8, !dbg !54
  %cmp = icmp ult i64 %4, %5, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !57
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !57
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !57
  %9 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !61
  store i32 %8, i32* %arrayidx3, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %10, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !69
  store i32 0, i32* %arrayidx4, align 4, !dbg !70
  %11 = load i32*, i32** %data, align 8, !dbg !71
  call void @printWLine(i32* %11), !dbg !72
  ret void, !dbg !73
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #6, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #6, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !103
  store i32* %arraydecay, i32** %data, align 8, !dbg !104
  %0 = load i32*, i32** %data, align 8, !dbg !105
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !108
  %1 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !111, metadata !DIExpression()), !dbg !113
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !116, metadata !DIExpression()), !dbg !117
  %3 = load i32*, i32** %data, align 8, !dbg !118
  %call1 = call i64 @wcslen(i32* %3) #7, !dbg !119
  store i64 %call1, i64* %dataLen, align 8, !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !124
  %5 = load i64, i64* %dataLen, align 8, !dbg !126
  %cmp = icmp ult i64 %4, %5, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !129
  %7 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !129
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !129
  %9 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !133
  store i32 %8, i32* %arrayidx3, align 4, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %10, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !140
  store i32 0, i32* %arrayidx4, align 4, !dbg !141
  %11 = load i32*, i32** %data, align 8, !dbg !142
  call void @printWLine(i32* %11), !dbg !143
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !145 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !148, metadata !DIExpression()), !dbg !149
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !150
  store i32* %arraydecay, i32** %data, align 8, !dbg !151
  %0 = load i32*, i32** %data, align 8, !dbg !152
  %call = call i32* @wmemset(i32* %0, i32 65, i64 49) #6, !dbg !155
  %1 = load i32*, i32** %data, align 8, !dbg !156
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !156
  store i32 0, i32* %arrayidx, align 4, !dbg !157
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !158, metadata !DIExpression()), !dbg !160
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !160
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !160
  call void @llvm.dbg.declare(metadata i64* %i, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !163, metadata !DIExpression()), !dbg !164
  %3 = load i32*, i32** %data, align 8, !dbg !165
  %call1 = call i64 @wcslen(i32* %3) #7, !dbg !166
  store i64 %call1, i64* %dataLen, align 8, !dbg !167
  store i64 0, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !170

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !171
  %5 = load i64, i64* %dataLen, align 8, !dbg !173
  %cmp = icmp ult i64 %4, %5, !dbg !174
  br i1 %cmp, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !176
  %7 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !176
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !176
  %9 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !180
  store i32 %8, i32* %arrayidx3, align 4, !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !183
  %inc = add i64 %10, 1, !dbg !183
  store i64 %inc, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !187
  store i32 0, i32* %arrayidx4, align 4, !dbg !188
  %11 = load i32*, i32** %data, align 8, !dbg !189
  call void @printWLine(i32* %11), !dbg !190
  ret void, !dbg !191
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04_bad", scope: !12, file: !12, line: 30, type: !13, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 32, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 32, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 33, column: 13, scope: !11)
!26 = !DILocation(line: 34, column: 12, scope: !11)
!27 = !DILocation(line: 34, column: 10, scope: !11)
!28 = !DILocation(line: 38, column: 17, scope: !29)
!29 = distinct !DILexicalBlock(scope: !30, file: !12, line: 36, column: 5)
!30 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 8)
!31 = !DILocation(line: 38, column: 9, scope: !29)
!32 = !DILocation(line: 39, column: 9, scope: !29)
!33 = !DILocation(line: 39, column: 21, scope: !29)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !12, line: 42, type: !36)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 42, column: 17, scope: !35)
!40 = !DILocalVariable(name: "i", scope: !35, file: !12, line: 43, type: !41)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !42)
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 43, column: 16, scope: !35)
!44 = !DILocalVariable(name: "dataLen", scope: !35, file: !12, line: 43, type: !41)
!45 = !DILocation(line: 43, column: 19, scope: !35)
!46 = !DILocation(line: 44, column: 26, scope: !35)
!47 = !DILocation(line: 44, column: 19, scope: !35)
!48 = !DILocation(line: 44, column: 17, scope: !35)
!49 = !DILocation(line: 46, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !35, file: !12, line: 46, column: 9)
!51 = !DILocation(line: 46, column: 14, scope: !50)
!52 = !DILocation(line: 46, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 46, column: 9)
!54 = !DILocation(line: 46, column: 25, scope: !53)
!55 = !DILocation(line: 46, column: 23, scope: !53)
!56 = !DILocation(line: 46, column: 9, scope: !50)
!57 = !DILocation(line: 48, column: 23, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !12, line: 47, column: 9)
!59 = !DILocation(line: 48, column: 28, scope: !58)
!60 = !DILocation(line: 48, column: 18, scope: !58)
!61 = !DILocation(line: 48, column: 13, scope: !58)
!62 = !DILocation(line: 48, column: 21, scope: !58)
!63 = !DILocation(line: 49, column: 9, scope: !58)
!64 = !DILocation(line: 46, column: 35, scope: !53)
!65 = !DILocation(line: 46, column: 9, scope: !53)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 49, column: 9, scope: !50)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 50, column: 9, scope: !35)
!70 = !DILocation(line: 50, column: 20, scope: !35)
!71 = !DILocation(line: 51, column: 20, scope: !35)
!72 = !DILocation(line: 51, column: 9, scope: !35)
!73 = !DILocation(line: 53, column: 1, scope: !11)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_04_good", scope: !12, file: !12, line: 116, type: !13, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 118, column: 5, scope: !74)
!76 = !DILocation(line: 119, column: 5, scope: !74)
!77 = !DILocation(line: 120, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 132, type: !79, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!19, !19, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !12, line: 132, type: !19)
!85 = !DILocation(line: 132, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !12, line: 132, type: !81)
!87 = !DILocation(line: 132, column: 27, scope: !78)
!88 = !DILocation(line: 135, column: 22, scope: !78)
!89 = !DILocation(line: 135, column: 12, scope: !78)
!90 = !DILocation(line: 135, column: 5, scope: !78)
!91 = !DILocation(line: 137, column: 5, scope: !78)
!92 = !DILocation(line: 138, column: 5, scope: !78)
!93 = !DILocation(line: 139, column: 5, scope: !78)
!94 = !DILocation(line: 142, column: 5, scope: !78)
!95 = !DILocation(line: 143, column: 5, scope: !78)
!96 = !DILocation(line: 144, column: 5, scope: !78)
!97 = !DILocation(line: 146, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 62, type: !16)
!100 = !DILocation(line: 62, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !12, line: 63, type: !22)
!102 = !DILocation(line: 63, column: 13, scope: !98)
!103 = !DILocation(line: 64, column: 12, scope: !98)
!104 = !DILocation(line: 64, column: 10, scope: !98)
!105 = !DILocation(line: 73, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !12, line: 71, column: 5)
!107 = distinct !DILexicalBlock(scope: !98, file: !12, line: 65, column: 8)
!108 = !DILocation(line: 73, column: 9, scope: !106)
!109 = !DILocation(line: 74, column: 9, scope: !106)
!110 = !DILocation(line: 74, column: 20, scope: !106)
!111 = !DILocalVariable(name: "dest", scope: !112, file: !12, line: 77, type: !36)
!112 = distinct !DILexicalBlock(scope: !98, file: !12, line: 76, column: 5)
!113 = !DILocation(line: 77, column: 17, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !112, file: !12, line: 78, type: !41)
!115 = !DILocation(line: 78, column: 16, scope: !112)
!116 = !DILocalVariable(name: "dataLen", scope: !112, file: !12, line: 78, type: !41)
!117 = !DILocation(line: 78, column: 19, scope: !112)
!118 = !DILocation(line: 79, column: 26, scope: !112)
!119 = !DILocation(line: 79, column: 19, scope: !112)
!120 = !DILocation(line: 79, column: 17, scope: !112)
!121 = !DILocation(line: 81, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !112, file: !12, line: 81, column: 9)
!123 = !DILocation(line: 81, column: 14, scope: !122)
!124 = !DILocation(line: 81, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 81, column: 9)
!126 = !DILocation(line: 81, column: 25, scope: !125)
!127 = !DILocation(line: 81, column: 23, scope: !125)
!128 = !DILocation(line: 81, column: 9, scope: !122)
!129 = !DILocation(line: 83, column: 23, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !12, line: 82, column: 9)
!131 = !DILocation(line: 83, column: 28, scope: !130)
!132 = !DILocation(line: 83, column: 18, scope: !130)
!133 = !DILocation(line: 83, column: 13, scope: !130)
!134 = !DILocation(line: 83, column: 21, scope: !130)
!135 = !DILocation(line: 84, column: 9, scope: !130)
!136 = !DILocation(line: 81, column: 35, scope: !125)
!137 = !DILocation(line: 81, column: 9, scope: !125)
!138 = distinct !{!138, !128, !139, !68}
!139 = !DILocation(line: 84, column: 9, scope: !122)
!140 = !DILocation(line: 85, column: 9, scope: !112)
!141 = !DILocation(line: 85, column: 20, scope: !112)
!142 = !DILocation(line: 86, column: 20, scope: !112)
!143 = !DILocation(line: 86, column: 9, scope: !112)
!144 = !DILocation(line: 88, column: 1, scope: !98)
!145 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", scope: !145, file: !12, line: 93, type: !16)
!147 = !DILocation(line: 93, column: 15, scope: !145)
!148 = !DILocalVariable(name: "dataBuffer", scope: !145, file: !12, line: 94, type: !22)
!149 = !DILocation(line: 94, column: 13, scope: !145)
!150 = !DILocation(line: 95, column: 12, scope: !145)
!151 = !DILocation(line: 95, column: 10, scope: !145)
!152 = !DILocation(line: 99, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !154, file: !12, line: 97, column: 5)
!154 = distinct !DILexicalBlock(scope: !145, file: !12, line: 96, column: 8)
!155 = !DILocation(line: 99, column: 9, scope: !153)
!156 = !DILocation(line: 100, column: 9, scope: !153)
!157 = !DILocation(line: 100, column: 20, scope: !153)
!158 = !DILocalVariable(name: "dest", scope: !159, file: !12, line: 103, type: !36)
!159 = distinct !DILexicalBlock(scope: !145, file: !12, line: 102, column: 5)
!160 = !DILocation(line: 103, column: 17, scope: !159)
!161 = !DILocalVariable(name: "i", scope: !159, file: !12, line: 104, type: !41)
!162 = !DILocation(line: 104, column: 16, scope: !159)
!163 = !DILocalVariable(name: "dataLen", scope: !159, file: !12, line: 104, type: !41)
!164 = !DILocation(line: 104, column: 19, scope: !159)
!165 = !DILocation(line: 105, column: 26, scope: !159)
!166 = !DILocation(line: 105, column: 19, scope: !159)
!167 = !DILocation(line: 105, column: 17, scope: !159)
!168 = !DILocation(line: 107, column: 16, scope: !169)
!169 = distinct !DILexicalBlock(scope: !159, file: !12, line: 107, column: 9)
!170 = !DILocation(line: 107, column: 14, scope: !169)
!171 = !DILocation(line: 107, column: 21, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !12, line: 107, column: 9)
!173 = !DILocation(line: 107, column: 25, scope: !172)
!174 = !DILocation(line: 107, column: 23, scope: !172)
!175 = !DILocation(line: 107, column: 9, scope: !169)
!176 = !DILocation(line: 109, column: 23, scope: !177)
!177 = distinct !DILexicalBlock(scope: !172, file: !12, line: 108, column: 9)
!178 = !DILocation(line: 109, column: 28, scope: !177)
!179 = !DILocation(line: 109, column: 18, scope: !177)
!180 = !DILocation(line: 109, column: 13, scope: !177)
!181 = !DILocation(line: 109, column: 21, scope: !177)
!182 = !DILocation(line: 110, column: 9, scope: !177)
!183 = !DILocation(line: 107, column: 35, scope: !172)
!184 = !DILocation(line: 107, column: 9, scope: !172)
!185 = distinct !{!185, !175, !186, !68}
!186 = !DILocation(line: 110, column: 9, scope: !169)
!187 = !DILocation(line: 111, column: 9, scope: !159)
!188 = !DILocation(line: 111, column: 20, scope: !159)
!189 = !DILocation(line: 112, column: 20, scope: !159)
!190 = !DILocation(line: 112, column: 9, scope: !159)
!191 = !DILocation(line: 114, column: 1, scope: !145)
