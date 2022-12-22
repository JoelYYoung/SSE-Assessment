; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_12.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_12_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_12_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.else:                                          ; preds = %entry
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  store i32* %6, i32** %data, align 8, !dbg !40
  %7 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !41
  store i32 0, i32* %arrayidx1, align 4, !dbg !42
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_12_bad.source to i8*), i64 44, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !53, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !55
  %call2 = call i64 @wcslen(i32* %arraydecay) #6, !dbg !56
  store i64 %call2, i64* %sourceLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !61
  %10 = load i64, i64* %sourceLen, align 8, !dbg !63
  %add = add i64 %10, 1, !dbg !64
  %cmp = icmp ult i64 %9, %add, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %11, !dbg !69
  %12 = load i32, i32* %arrayidx3, align 4, !dbg !69
  %13 = load i32*, i32** %data, align 8, !dbg !70
  %14 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !70
  store i32 %12, i32* %arrayidx4, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %15, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %16 = load i32*, i32** %data, align 8, !dbg !79
  call void @printWLine(i32* %16), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_12_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #7, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #7, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_12_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_12_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 40, align 16, !dbg !110
  %1 = bitcast i8* %0 to i32*, !dbg !111
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %2 = alloca i8, i64 44, align 16, !dbg !114
  %3 = bitcast i8* %2 to i32*, !dbg !115
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !113
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !116
  %tobool = icmp ne i32 %call, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !119
  store i32* %4, i32** %data, align 8, !dbg !121
  %5 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  br label %if.end, !dbg !124

if.else:                                          ; preds = %entry
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !125
  store i32* %6, i32** %data, align 8, !dbg !127
  %7 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx1 = getelementptr inbounds i32, i32* %7, i64 0, !dbg !128
  store i32 0, i32* %arrayidx1, align 4, !dbg !129
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !132
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !135, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !137
  %call2 = call i64 @wcslen(i32* %arraydecay) #6, !dbg !138
  store i64 %call2, i64* %sourceLen, align 8, !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !143
  %10 = load i64, i64* %sourceLen, align 8, !dbg !145
  %add = add i64 %10, 1, !dbg !146
  %cmp = icmp ult i64 %9, %add, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %11, !dbg !151
  %12 = load i32, i32* %arrayidx3, align 4, !dbg !151
  %13 = load i32*, i32** %data, align 8, !dbg !152
  %14 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !152
  store i32 %12, i32* %arrayidx4, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %15, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %16 = load i32*, i32** %data, align 8, !dbg !160
  call void @printWLine(i32* %16), !dbg !161
  ret void, !dbg !162
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_12_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_12.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 30, type: !4)
!20 = !DILocation(line: 30, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 31, type: !4)
!22 = !DILocation(line: 31, column: 15, scope: !15)
!23 = !DILocation(line: 31, column: 42, scope: !15)
!24 = !DILocation(line: 31, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 32, type: !4)
!26 = !DILocation(line: 32, column: 15, scope: !15)
!27 = !DILocation(line: 32, column: 43, scope: !15)
!28 = !DILocation(line: 32, column: 32, scope: !15)
!29 = !DILocation(line: 33, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 8)
!31 = !DILocation(line: 33, column: 8, scope: !15)
!32 = !DILocation(line: 37, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 34, column: 5)
!34 = !DILocation(line: 37, column: 14, scope: !33)
!35 = !DILocation(line: 38, column: 9, scope: !33)
!36 = !DILocation(line: 38, column: 17, scope: !33)
!37 = !DILocation(line: 39, column: 5, scope: !33)
!38 = !DILocation(line: 44, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !30, file: !16, line: 41, column: 5)
!40 = !DILocation(line: 44, column: 14, scope: !39)
!41 = !DILocation(line: 45, column: 9, scope: !39)
!42 = !DILocation(line: 45, column: 17, scope: !39)
!43 = !DILocalVariable(name: "source", scope: !44, file: !16, line: 48, type: !45)
!44 = distinct !DILexicalBlock(scope: !15, file: !16, line: 47, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 11)
!48 = !DILocation(line: 48, column: 17, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !44, file: !16, line: 49, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !51)
!51 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 49, column: 16, scope: !44)
!53 = !DILocalVariable(name: "sourceLen", scope: !44, file: !16, line: 49, type: !50)
!54 = !DILocation(line: 49, column: 19, scope: !44)
!55 = !DILocation(line: 50, column: 28, scope: !44)
!56 = !DILocation(line: 50, column: 21, scope: !44)
!57 = !DILocation(line: 50, column: 19, scope: !44)
!58 = !DILocation(line: 53, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !44, file: !16, line: 53, column: 9)
!60 = !DILocation(line: 53, column: 14, scope: !59)
!61 = !DILocation(line: 53, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !16, line: 53, column: 9)
!63 = !DILocation(line: 53, column: 25, scope: !62)
!64 = !DILocation(line: 53, column: 35, scope: !62)
!65 = !DILocation(line: 53, column: 23, scope: !62)
!66 = !DILocation(line: 53, column: 9, scope: !59)
!67 = !DILocation(line: 55, column: 30, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !16, line: 54, column: 9)
!69 = !DILocation(line: 55, column: 23, scope: !68)
!70 = !DILocation(line: 55, column: 13, scope: !68)
!71 = !DILocation(line: 55, column: 18, scope: !68)
!72 = !DILocation(line: 55, column: 21, scope: !68)
!73 = !DILocation(line: 56, column: 9, scope: !68)
!74 = !DILocation(line: 53, column: 41, scope: !62)
!75 = !DILocation(line: 53, column: 9, scope: !62)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 56, column: 9, scope: !59)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 57, column: 20, scope: !44)
!80 = !DILocation(line: 57, column: 9, scope: !44)
!81 = !DILocation(line: 59, column: 1, scope: !15)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_12_good", scope: !16, file: !16, line: 100, type: !17, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocation(line: 102, column: 5, scope: !82)
!84 = !DILocation(line: 103, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 115, type: !86, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!7, !7, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !16, line: 115, type: !7)
!92 = !DILocation(line: 115, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !16, line: 115, type: !88)
!94 = !DILocation(line: 115, column: 27, scope: !85)
!95 = !DILocation(line: 118, column: 22, scope: !85)
!96 = !DILocation(line: 118, column: 12, scope: !85)
!97 = !DILocation(line: 118, column: 5, scope: !85)
!98 = !DILocation(line: 120, column: 5, scope: !85)
!99 = !DILocation(line: 121, column: 5, scope: !85)
!100 = !DILocation(line: 122, column: 5, scope: !85)
!101 = !DILocation(line: 125, column: 5, scope: !85)
!102 = !DILocation(line: 126, column: 5, scope: !85)
!103 = !DILocation(line: 127, column: 5, scope: !85)
!104 = !DILocation(line: 129, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 67, type: !17, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !16, line: 69, type: !4)
!107 = !DILocation(line: 69, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !16, line: 70, type: !4)
!109 = !DILocation(line: 70, column: 15, scope: !105)
!110 = !DILocation(line: 70, column: 42, scope: !105)
!111 = !DILocation(line: 70, column: 31, scope: !105)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !16, line: 71, type: !4)
!113 = !DILocation(line: 71, column: 15, scope: !105)
!114 = !DILocation(line: 71, column: 43, scope: !105)
!115 = !DILocation(line: 71, column: 32, scope: !105)
!116 = !DILocation(line: 72, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !105, file: !16, line: 72, column: 8)
!118 = !DILocation(line: 72, column: 8, scope: !105)
!119 = !DILocation(line: 76, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !16, line: 73, column: 5)
!121 = !DILocation(line: 76, column: 14, scope: !120)
!122 = !DILocation(line: 77, column: 9, scope: !120)
!123 = !DILocation(line: 77, column: 17, scope: !120)
!124 = !DILocation(line: 78, column: 5, scope: !120)
!125 = !DILocation(line: 83, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !117, file: !16, line: 80, column: 5)
!127 = !DILocation(line: 83, column: 14, scope: !126)
!128 = !DILocation(line: 84, column: 9, scope: !126)
!129 = !DILocation(line: 84, column: 17, scope: !126)
!130 = !DILocalVariable(name: "source", scope: !131, file: !16, line: 87, type: !45)
!131 = distinct !DILexicalBlock(scope: !105, file: !16, line: 86, column: 5)
!132 = !DILocation(line: 87, column: 17, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !131, file: !16, line: 88, type: !50)
!134 = !DILocation(line: 88, column: 16, scope: !131)
!135 = !DILocalVariable(name: "sourceLen", scope: !131, file: !16, line: 88, type: !50)
!136 = !DILocation(line: 88, column: 19, scope: !131)
!137 = !DILocation(line: 89, column: 28, scope: !131)
!138 = !DILocation(line: 89, column: 21, scope: !131)
!139 = !DILocation(line: 89, column: 19, scope: !131)
!140 = !DILocation(line: 92, column: 16, scope: !141)
!141 = distinct !DILexicalBlock(scope: !131, file: !16, line: 92, column: 9)
!142 = !DILocation(line: 92, column: 14, scope: !141)
!143 = !DILocation(line: 92, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !16, line: 92, column: 9)
!145 = !DILocation(line: 92, column: 25, scope: !144)
!146 = !DILocation(line: 92, column: 35, scope: !144)
!147 = !DILocation(line: 92, column: 23, scope: !144)
!148 = !DILocation(line: 92, column: 9, scope: !141)
!149 = !DILocation(line: 94, column: 30, scope: !150)
!150 = distinct !DILexicalBlock(scope: !144, file: !16, line: 93, column: 9)
!151 = !DILocation(line: 94, column: 23, scope: !150)
!152 = !DILocation(line: 94, column: 13, scope: !150)
!153 = !DILocation(line: 94, column: 18, scope: !150)
!154 = !DILocation(line: 94, column: 21, scope: !150)
!155 = !DILocation(line: 95, column: 9, scope: !150)
!156 = !DILocation(line: 92, column: 41, scope: !144)
!157 = !DILocation(line: 92, column: 9, scope: !144)
!158 = distinct !{!158, !148, !159, !78}
!159 = !DILocation(line: 95, column: 9, scope: !141)
!160 = !DILocation(line: 96, column: 20, scope: !131)
!161 = !DILocation(line: 96, column: 9, scope: !131)
!162 = !DILocation(line: 98, column: 1, scope: !105)
