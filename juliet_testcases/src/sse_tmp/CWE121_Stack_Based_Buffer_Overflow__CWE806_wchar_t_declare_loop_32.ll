; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !33, metadata !DIExpression()), !dbg !35
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !36
  %1 = load i32*, i32** %0, align 8, !dbg !37
  store i32* %1, i32** %data1, align 8, !dbg !35
  %2 = load i32*, i32** %data1, align 8, !dbg !38
  %call = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !39
  %3 = load i32*, i32** %data1, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %4 = load i32*, i32** %data1, align 8, !dbg !42
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !43
  store i32* %4, i32** %5, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !48
  %7 = load i32*, i32** %6, align 8, !dbg !49
  store i32* %7, i32** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %8 = bitcast [50 x i32]* %dest to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 200, i1 false), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %i, metadata !56, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !60, metadata !DIExpression()), !dbg !61
  %9 = load i32*, i32** %data2, align 8, !dbg !62
  %call3 = call i64 @wcslen(i32* %9) #7, !dbg !63
  store i64 %call3, i64* %dataLen, align 8, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i64, i64* %i, align 8, !dbg !68
  %11 = load i64, i64* %dataLen, align 8, !dbg !70
  %cmp = icmp ult i64 %10, %11, !dbg !71
  br i1 %cmp, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data2, align 8, !dbg !73
  %13 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !73
  %14 = load i32, i32* %arrayidx4, align 4, !dbg !73
  %15 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %15, !dbg !77
  store i32 %14, i32* %arrayidx5, align 4, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %16, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !85
  store i32 0, i32* %arrayidx6, align 4, !dbg !86
  %17 = load i32*, i32** %data2, align 8, !dbg !87
  call void @printWLine(i32* %17), !dbg !88
  ret void, !dbg !89
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
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_32_good() #0 !dbg !90 {
entry:
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* null) #6, !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 %conv) #6, !dbg !105
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_32_good(), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_32_bad(), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !116, metadata !DIExpression()), !dbg !117
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !118, metadata !DIExpression()), !dbg !119
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !122
  store i32* %arraydecay, i32** %data, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !124, metadata !DIExpression()), !dbg !126
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !127
  %1 = load i32*, i32** %0, align 8, !dbg !128
  store i32* %1, i32** %data1, align 8, !dbg !126
  %2 = load i32*, i32** %data1, align 8, !dbg !129
  %call = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !130
  %3 = load i32*, i32** %data1, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !131
  store i32 0, i32* %arrayidx, align 4, !dbg !132
  %4 = load i32*, i32** %data1, align 8, !dbg !133
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !134
  store i32* %4, i32** %5, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !136, metadata !DIExpression()), !dbg !138
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !139
  %7 = load i32*, i32** %6, align 8, !dbg !140
  store i32* %7, i32** %data2, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !141, metadata !DIExpression()), !dbg !143
  %8 = bitcast [50 x i32]* %dest to i8*, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 200, i1 false), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %i, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !146, metadata !DIExpression()), !dbg !147
  %9 = load i32*, i32** %data2, align 8, !dbg !148
  %call3 = call i64 @wcslen(i32* %9) #7, !dbg !149
  store i64 %call3, i64* %dataLen, align 8, !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i64, i64* %i, align 8, !dbg !154
  %11 = load i64, i64* %dataLen, align 8, !dbg !156
  %cmp = icmp ult i64 %10, %11, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data2, align 8, !dbg !159
  %13 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !159
  %14 = load i32, i32* %arrayidx4, align 4, !dbg !159
  %15 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %15, !dbg !163
  store i32 %14, i32* %arrayidx5, align 4, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %16, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !170
  store i32 0, i32* %arrayidx6, align 4, !dbg !171
  %17 = load i32*, i32** %data2, align 8, !dbg !172
  call void @printWLine(i32* %17), !dbg !173
  ret void, !dbg !174
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_32.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !11)
!24 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !11)
!26 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 28, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 28, column: 13, scope: !11)
!31 = !DILocation(line: 29, column: 12, scope: !11)
!32 = !DILocation(line: 29, column: 10, scope: !11)
!33 = !DILocalVariable(name: "data", scope: !34, file: !12, line: 31, type: !16)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!35 = !DILocation(line: 31, column: 19, scope: !34)
!36 = !DILocation(line: 31, column: 27, scope: !34)
!37 = !DILocation(line: 31, column: 26, scope: !34)
!38 = !DILocation(line: 33, column: 17, scope: !34)
!39 = !DILocation(line: 33, column: 9, scope: !34)
!40 = !DILocation(line: 34, column: 9, scope: !34)
!41 = !DILocation(line: 34, column: 21, scope: !34)
!42 = !DILocation(line: 35, column: 21, scope: !34)
!43 = !DILocation(line: 35, column: 10, scope: !34)
!44 = !DILocation(line: 35, column: 19, scope: !34)
!45 = !DILocalVariable(name: "data", scope: !46, file: !12, line: 38, type: !16)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 19, scope: !46)
!48 = !DILocation(line: 38, column: 27, scope: !46)
!49 = !DILocation(line: 38, column: 26, scope: !46)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !12, line: 40, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !12, line: 39, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 50)
!55 = !DILocation(line: 40, column: 21, scope: !51)
!56 = !DILocalVariable(name: "i", scope: !51, file: !12, line: 41, type: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !58)
!58 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 41, column: 20, scope: !51)
!60 = !DILocalVariable(name: "dataLen", scope: !51, file: !12, line: 41, type: !57)
!61 = !DILocation(line: 41, column: 23, scope: !51)
!62 = !DILocation(line: 42, column: 30, scope: !51)
!63 = !DILocation(line: 42, column: 23, scope: !51)
!64 = !DILocation(line: 42, column: 21, scope: !51)
!65 = !DILocation(line: 44, column: 20, scope: !66)
!66 = distinct !DILexicalBlock(scope: !51, file: !12, line: 44, column: 13)
!67 = !DILocation(line: 44, column: 18, scope: !66)
!68 = !DILocation(line: 44, column: 25, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !12, line: 44, column: 13)
!70 = !DILocation(line: 44, column: 29, scope: !69)
!71 = !DILocation(line: 44, column: 27, scope: !69)
!72 = !DILocation(line: 44, column: 13, scope: !66)
!73 = !DILocation(line: 46, column: 27, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !12, line: 45, column: 13)
!75 = !DILocation(line: 46, column: 32, scope: !74)
!76 = !DILocation(line: 46, column: 22, scope: !74)
!77 = !DILocation(line: 46, column: 17, scope: !74)
!78 = !DILocation(line: 46, column: 25, scope: !74)
!79 = !DILocation(line: 47, column: 13, scope: !74)
!80 = !DILocation(line: 44, column: 39, scope: !69)
!81 = !DILocation(line: 44, column: 13, scope: !69)
!82 = distinct !{!82, !72, !83, !84}
!83 = !DILocation(line: 47, column: 13, scope: !66)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 48, column: 13, scope: !51)
!86 = !DILocation(line: 48, column: 24, scope: !51)
!87 = !DILocation(line: 49, column: 24, scope: !51)
!88 = !DILocation(line: 49, column: 13, scope: !51)
!89 = !DILocation(line: 52, column: 1, scope: !11)
!90 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_32_good", scope: !12, file: !12, line: 90, type: !13, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!91 = !DILocation(line: 92, column: 5, scope: !90)
!92 = !DILocation(line: 93, column: 1, scope: !90)
!93 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 104, type: !94, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!19, !19, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !12, line: 104, type: !19)
!100 = !DILocation(line: 104, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !12, line: 104, type: !96)
!102 = !DILocation(line: 104, column: 27, scope: !93)
!103 = !DILocation(line: 107, column: 22, scope: !93)
!104 = !DILocation(line: 107, column: 12, scope: !93)
!105 = !DILocation(line: 107, column: 5, scope: !93)
!106 = !DILocation(line: 109, column: 5, scope: !93)
!107 = !DILocation(line: 110, column: 5, scope: !93)
!108 = !DILocation(line: 111, column: 5, scope: !93)
!109 = !DILocation(line: 114, column: 5, scope: !93)
!110 = !DILocation(line: 115, column: 5, scope: !93)
!111 = !DILocation(line: 116, column: 5, scope: !93)
!112 = !DILocation(line: 118, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !12, line: 61, type: !16)
!115 = !DILocation(line: 61, column: 15, scope: !113)
!116 = !DILocalVariable(name: "dataPtr1", scope: !113, file: !12, line: 62, type: !22)
!117 = !DILocation(line: 62, column: 16, scope: !113)
!118 = !DILocalVariable(name: "dataPtr2", scope: !113, file: !12, line: 63, type: !22)
!119 = !DILocation(line: 63, column: 16, scope: !113)
!120 = !DILocalVariable(name: "dataBuffer", scope: !113, file: !12, line: 64, type: !27)
!121 = !DILocation(line: 64, column: 13, scope: !113)
!122 = !DILocation(line: 65, column: 12, scope: !113)
!123 = !DILocation(line: 65, column: 10, scope: !113)
!124 = !DILocalVariable(name: "data", scope: !125, file: !12, line: 67, type: !16)
!125 = distinct !DILexicalBlock(scope: !113, file: !12, line: 66, column: 5)
!126 = !DILocation(line: 67, column: 19, scope: !125)
!127 = !DILocation(line: 67, column: 27, scope: !125)
!128 = !DILocation(line: 67, column: 26, scope: !125)
!129 = !DILocation(line: 69, column: 17, scope: !125)
!130 = !DILocation(line: 69, column: 9, scope: !125)
!131 = !DILocation(line: 70, column: 9, scope: !125)
!132 = !DILocation(line: 70, column: 20, scope: !125)
!133 = !DILocation(line: 71, column: 21, scope: !125)
!134 = !DILocation(line: 71, column: 10, scope: !125)
!135 = !DILocation(line: 71, column: 19, scope: !125)
!136 = !DILocalVariable(name: "data", scope: !137, file: !12, line: 74, type: !16)
!137 = distinct !DILexicalBlock(scope: !113, file: !12, line: 73, column: 5)
!138 = !DILocation(line: 74, column: 19, scope: !137)
!139 = !DILocation(line: 74, column: 27, scope: !137)
!140 = !DILocation(line: 74, column: 26, scope: !137)
!141 = !DILocalVariable(name: "dest", scope: !142, file: !12, line: 76, type: !52)
!142 = distinct !DILexicalBlock(scope: !137, file: !12, line: 75, column: 9)
!143 = !DILocation(line: 76, column: 21, scope: !142)
!144 = !DILocalVariable(name: "i", scope: !142, file: !12, line: 77, type: !57)
!145 = !DILocation(line: 77, column: 20, scope: !142)
!146 = !DILocalVariable(name: "dataLen", scope: !142, file: !12, line: 77, type: !57)
!147 = !DILocation(line: 77, column: 23, scope: !142)
!148 = !DILocation(line: 78, column: 30, scope: !142)
!149 = !DILocation(line: 78, column: 23, scope: !142)
!150 = !DILocation(line: 78, column: 21, scope: !142)
!151 = !DILocation(line: 80, column: 20, scope: !152)
!152 = distinct !DILexicalBlock(scope: !142, file: !12, line: 80, column: 13)
!153 = !DILocation(line: 80, column: 18, scope: !152)
!154 = !DILocation(line: 80, column: 25, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !12, line: 80, column: 13)
!156 = !DILocation(line: 80, column: 29, scope: !155)
!157 = !DILocation(line: 80, column: 27, scope: !155)
!158 = !DILocation(line: 80, column: 13, scope: !152)
!159 = !DILocation(line: 82, column: 27, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !12, line: 81, column: 13)
!161 = !DILocation(line: 82, column: 32, scope: !160)
!162 = !DILocation(line: 82, column: 22, scope: !160)
!163 = !DILocation(line: 82, column: 17, scope: !160)
!164 = !DILocation(line: 82, column: 25, scope: !160)
!165 = !DILocation(line: 83, column: 13, scope: !160)
!166 = !DILocation(line: 80, column: 39, scope: !155)
!167 = !DILocation(line: 80, column: 13, scope: !155)
!168 = distinct !{!168, !158, !169, !84}
!169 = !DILocation(line: 83, column: 13, scope: !152)
!170 = !DILocation(line: 84, column: 13, scope: !142)
!171 = !DILocation(line: 84, column: 24, scope: !142)
!172 = !DILocation(line: 85, column: 24, scope: !142)
!173 = !DILocation(line: 85, column: 13, scope: !142)
!174 = !DILocation(line: 88, column: 1, scope: !113)
