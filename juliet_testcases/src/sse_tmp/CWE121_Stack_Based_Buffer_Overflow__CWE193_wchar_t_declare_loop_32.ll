; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_32.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_32_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !36, metadata !DIExpression()), !dbg !38
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !39
  %1 = load i32*, i32** %0, align 8, !dbg !40
  store i32* %1, i32** %data1, align 8, !dbg !38
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !41
  store i32* %arraydecay, i32** %data1, align 8, !dbg !42
  %2 = load i32*, i32** %data1, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %3 = load i32*, i32** %data1, align 8, !dbg !45
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !46
  store i32* %3, i32** %4, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !48, metadata !DIExpression()), !dbg !50
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !51
  %6 = load i32*, i32** %5, align 8, !dbg !52
  store i32* %6, i32** %data2, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !53, metadata !DIExpression()), !dbg !55
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_32_bad.source to i8*), i64 44, i1 false), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %i, metadata !56, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !60, metadata !DIExpression()), !dbg !61
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !62
  %call = call i64 @wcslen(i32* %arraydecay3) #6, !dbg !63
  store i64 %call, i64* %sourceLen, align 8, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !68
  %9 = load i64, i64* %sourceLen, align 8, !dbg !70
  %add = add i64 %9, 1, !dbg !71
  %cmp = icmp ult i64 %8, %add, !dbg !72
  br i1 %cmp, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx4 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !76
  %11 = load i32, i32* %arrayidx4, align 4, !dbg !76
  %12 = load i32*, i32** %data2, align 8, !dbg !77
  %13 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !77
  store i32 %11, i32* %arrayidx5, align 4, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %14, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data2, align 8, !dbg !86
  call void @printWLine(i32* %15), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_32_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* null) #7, !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 %conv) #7, !dbg !104
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_32_good(), !dbg !106
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_32_bad(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !115, metadata !DIExpression()), !dbg !116
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !117, metadata !DIExpression()), !dbg !118
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !123, metadata !DIExpression()), !dbg !125
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !126
  %1 = load i32*, i32** %0, align 8, !dbg !127
  store i32* %1, i32** %data1, align 8, !dbg !125
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !128
  store i32* %arraydecay, i32** %data1, align 8, !dbg !129
  %2 = load i32*, i32** %data1, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  %3 = load i32*, i32** %data1, align 8, !dbg !132
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !133
  store i32* %3, i32** %4, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !135, metadata !DIExpression()), !dbg !137
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !138
  %6 = load i32*, i32** %5, align 8, !dbg !139
  store i32* %6, i32** %data2, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !140, metadata !DIExpression()), !dbg !142
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !142
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !145, metadata !DIExpression()), !dbg !146
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !147
  %call = call i64 @wcslen(i32* %arraydecay3) #6, !dbg !148
  store i64 %call, i64* %sourceLen, align 8, !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !153
  %9 = load i64, i64* %sourceLen, align 8, !dbg !155
  %add = add i64 %9, 1, !dbg !156
  %cmp = icmp ult i64 %8, %add, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx4 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %10, !dbg !161
  %11 = load i32, i32* %arrayidx4, align 4, !dbg !161
  %12 = load i32*, i32** %data2, align 8, !dbg !162
  %13 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !162
  store i32 %11, i32* %arrayidx5, align 4, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %14, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data2, align 8, !dbg !170
  call void @printWLine(i32* %15), !dbg !171
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_32.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_32_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_32.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 31, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!23 = !DILocation(line: 31, column: 16, scope: !11)
!24 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 32, type: !22)
!25 = !DILocation(line: 32, column: 16, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 10)
!30 = !DILocation(line: 33, column: 13, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 352, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 34, column: 13, scope: !11)
!36 = !DILocalVariable(name: "data", scope: !37, file: !12, line: 36, type: !16)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!38 = !DILocation(line: 36, column: 19, scope: !37)
!39 = !DILocation(line: 36, column: 27, scope: !37)
!40 = !DILocation(line: 36, column: 26, scope: !37)
!41 = !DILocation(line: 39, column: 16, scope: !37)
!42 = !DILocation(line: 39, column: 14, scope: !37)
!43 = !DILocation(line: 40, column: 9, scope: !37)
!44 = !DILocation(line: 40, column: 17, scope: !37)
!45 = !DILocation(line: 41, column: 21, scope: !37)
!46 = !DILocation(line: 41, column: 10, scope: !37)
!47 = !DILocation(line: 41, column: 19, scope: !37)
!48 = !DILocalVariable(name: "data", scope: !49, file: !12, line: 44, type: !16)
!49 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!50 = !DILocation(line: 44, column: 19, scope: !49)
!51 = !DILocation(line: 44, column: 27, scope: !49)
!52 = !DILocation(line: 44, column: 26, scope: !49)
!53 = !DILocalVariable(name: "source", scope: !54, file: !12, line: 46, type: !32)
!54 = distinct !DILexicalBlock(scope: !49, file: !12, line: 45, column: 9)
!55 = !DILocation(line: 46, column: 21, scope: !54)
!56 = !DILocalVariable(name: "i", scope: !54, file: !12, line: 47, type: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !58)
!58 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 47, column: 20, scope: !54)
!60 = !DILocalVariable(name: "sourceLen", scope: !54, file: !12, line: 47, type: !57)
!61 = !DILocation(line: 47, column: 23, scope: !54)
!62 = !DILocation(line: 48, column: 32, scope: !54)
!63 = !DILocation(line: 48, column: 25, scope: !54)
!64 = !DILocation(line: 48, column: 23, scope: !54)
!65 = !DILocation(line: 51, column: 20, scope: !66)
!66 = distinct !DILexicalBlock(scope: !54, file: !12, line: 51, column: 13)
!67 = !DILocation(line: 51, column: 18, scope: !66)
!68 = !DILocation(line: 51, column: 25, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !12, line: 51, column: 13)
!70 = !DILocation(line: 51, column: 29, scope: !69)
!71 = !DILocation(line: 51, column: 39, scope: !69)
!72 = !DILocation(line: 51, column: 27, scope: !69)
!73 = !DILocation(line: 51, column: 13, scope: !66)
!74 = !DILocation(line: 53, column: 34, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !12, line: 52, column: 13)
!76 = !DILocation(line: 53, column: 27, scope: !75)
!77 = !DILocation(line: 53, column: 17, scope: !75)
!78 = !DILocation(line: 53, column: 22, scope: !75)
!79 = !DILocation(line: 53, column: 25, scope: !75)
!80 = !DILocation(line: 54, column: 13, scope: !75)
!81 = !DILocation(line: 51, column: 45, scope: !69)
!82 = !DILocation(line: 51, column: 13, scope: !69)
!83 = distinct !{!83, !73, !84, !85}
!84 = !DILocation(line: 54, column: 13, scope: !66)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocation(line: 55, column: 24, scope: !54)
!87 = !DILocation(line: 55, column: 13, scope: !54)
!88 = !DILocation(line: 58, column: 1, scope: !11)
!89 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_32_good", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocation(line: 99, column: 5, scope: !89)
!91 = !DILocation(line: 100, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 111, type: !93, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DISubroutineType(types: !94)
!94 = !{!19, !19, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !12, line: 111, type: !19)
!99 = !DILocation(line: 111, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !12, line: 111, type: !95)
!101 = !DILocation(line: 111, column: 27, scope: !92)
!102 = !DILocation(line: 114, column: 22, scope: !92)
!103 = !DILocation(line: 114, column: 12, scope: !92)
!104 = !DILocation(line: 114, column: 5, scope: !92)
!105 = !DILocation(line: 116, column: 5, scope: !92)
!106 = !DILocation(line: 117, column: 5, scope: !92)
!107 = !DILocation(line: 118, column: 5, scope: !92)
!108 = !DILocation(line: 121, column: 5, scope: !92)
!109 = !DILocation(line: 122, column: 5, scope: !92)
!110 = !DILocation(line: 123, column: 5, scope: !92)
!111 = !DILocation(line: 125, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!113 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 67, type: !16)
!114 = !DILocation(line: 67, column: 15, scope: !112)
!115 = !DILocalVariable(name: "dataPtr1", scope: !112, file: !12, line: 68, type: !22)
!116 = !DILocation(line: 68, column: 16, scope: !112)
!117 = !DILocalVariable(name: "dataPtr2", scope: !112, file: !12, line: 69, type: !22)
!118 = !DILocation(line: 69, column: 16, scope: !112)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !12, line: 70, type: !27)
!120 = !DILocation(line: 70, column: 13, scope: !112)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !12, line: 71, type: !32)
!122 = !DILocation(line: 71, column: 13, scope: !112)
!123 = !DILocalVariable(name: "data", scope: !124, file: !12, line: 73, type: !16)
!124 = distinct !DILexicalBlock(scope: !112, file: !12, line: 72, column: 5)
!125 = !DILocation(line: 73, column: 19, scope: !124)
!126 = !DILocation(line: 73, column: 27, scope: !124)
!127 = !DILocation(line: 73, column: 26, scope: !124)
!128 = !DILocation(line: 76, column: 16, scope: !124)
!129 = !DILocation(line: 76, column: 14, scope: !124)
!130 = !DILocation(line: 77, column: 9, scope: !124)
!131 = !DILocation(line: 77, column: 17, scope: !124)
!132 = !DILocation(line: 78, column: 21, scope: !124)
!133 = !DILocation(line: 78, column: 10, scope: !124)
!134 = !DILocation(line: 78, column: 19, scope: !124)
!135 = !DILocalVariable(name: "data", scope: !136, file: !12, line: 81, type: !16)
!136 = distinct !DILexicalBlock(scope: !112, file: !12, line: 80, column: 5)
!137 = !DILocation(line: 81, column: 19, scope: !136)
!138 = !DILocation(line: 81, column: 27, scope: !136)
!139 = !DILocation(line: 81, column: 26, scope: !136)
!140 = !DILocalVariable(name: "source", scope: !141, file: !12, line: 83, type: !32)
!141 = distinct !DILexicalBlock(scope: !136, file: !12, line: 82, column: 9)
!142 = !DILocation(line: 83, column: 21, scope: !141)
!143 = !DILocalVariable(name: "i", scope: !141, file: !12, line: 84, type: !57)
!144 = !DILocation(line: 84, column: 20, scope: !141)
!145 = !DILocalVariable(name: "sourceLen", scope: !141, file: !12, line: 84, type: !57)
!146 = !DILocation(line: 84, column: 23, scope: !141)
!147 = !DILocation(line: 85, column: 32, scope: !141)
!148 = !DILocation(line: 85, column: 25, scope: !141)
!149 = !DILocation(line: 85, column: 23, scope: !141)
!150 = !DILocation(line: 88, column: 20, scope: !151)
!151 = distinct !DILexicalBlock(scope: !141, file: !12, line: 88, column: 13)
!152 = !DILocation(line: 88, column: 18, scope: !151)
!153 = !DILocation(line: 88, column: 25, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !12, line: 88, column: 13)
!155 = !DILocation(line: 88, column: 29, scope: !154)
!156 = !DILocation(line: 88, column: 39, scope: !154)
!157 = !DILocation(line: 88, column: 27, scope: !154)
!158 = !DILocation(line: 88, column: 13, scope: !151)
!159 = !DILocation(line: 90, column: 34, scope: !160)
!160 = distinct !DILexicalBlock(scope: !154, file: !12, line: 89, column: 13)
!161 = !DILocation(line: 90, column: 27, scope: !160)
!162 = !DILocation(line: 90, column: 17, scope: !160)
!163 = !DILocation(line: 90, column: 22, scope: !160)
!164 = !DILocation(line: 90, column: 25, scope: !160)
!165 = !DILocation(line: 91, column: 13, scope: !160)
!166 = !DILocation(line: 88, column: 45, scope: !154)
!167 = !DILocation(line: 88, column: 13, scope: !154)
!168 = distinct !{!168, !158, !169, !85}
!169 = !DILocation(line: 91, column: 13, scope: !151)
!170 = !DILocation(line: 92, column: 24, scope: !141)
!171 = !DILocation(line: 92, column: 13, scope: !141)
!172 = !DILocation(line: 95, column: 1, scope: !112)
