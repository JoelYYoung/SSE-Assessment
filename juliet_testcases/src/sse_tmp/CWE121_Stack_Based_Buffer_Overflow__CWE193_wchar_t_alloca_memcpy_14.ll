; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_14.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_14_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_14_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 40, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 44, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32, i32* @globalFive, align 4, !dbg !29
  %cmp = icmp eq i32 %4, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !33
  store i32* %5, i32** %data, align 8, !dbg !35
  %6 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_14_bad.source to i8*), i64 44, i1 false), !dbg !44
  %8 = load i32*, i32** %data, align 8, !dbg !45
  %9 = bitcast i32* %8 to i8*, !dbg !46
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !46
  %10 = bitcast i32* %arraydecay to i8*, !dbg !46
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !47
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !48
  %add = add i64 %call, 1, !dbg !49
  %mul = mul i64 %add, 4, !dbg !50
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 %mul, i1 false), !dbg !46
  %11 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %11), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_14_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #7, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #7, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_14_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_14_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 40, align 16, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %2 = alloca i8, i64 44, align 16, !dbg !87
  %3 = bitcast i8* %2 to i32*, !dbg !88
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !86
  %4 = load i32, i32* @globalFive, align 4, !dbg !89
  %cmp = icmp ne i32 %4, 5, !dbg !91
  br i1 %cmp, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end, !dbg !95

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !96
  store i32* %5, i32** %data, align 8, !dbg !98
  %6 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !103
  %8 = load i32*, i32** %data, align 8, !dbg !104
  %9 = bitcast i32* %8 to i8*, !dbg !105
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !105
  %10 = bitcast i32* %arraydecay to i8*, !dbg !105
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !106
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !107
  %add = add i64 %call, 1, !dbg !108
  %mul = mul i64 %add, 4, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 %mul, i1 false), !dbg !105
  %11 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* %11), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = alloca i8, i64 40, align 16, !dbg !118
  %1 = bitcast i8* %0 to i32*, !dbg !119
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %2 = alloca i8, i64 44, align 16, !dbg !122
  %3 = bitcast i8* %2 to i32*, !dbg !123
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !121
  %4 = load i32, i32* @globalFive, align 4, !dbg !124
  %cmp = icmp eq i32 %4, 5, !dbg !126
  br i1 %cmp, label %if.then, label %if.end, !dbg !127

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !128
  store i32* %5, i32** %data, align 8, !dbg !130
  %6 = load i32*, i32** %data, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !131
  store i32 0, i32* %arrayidx, align 4, !dbg !132
  br label %if.end, !dbg !133

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !134, metadata !DIExpression()), !dbg !136
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !136
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !136
  %8 = load i32*, i32** %data, align 8, !dbg !137
  %9 = bitcast i32* %8 to i8*, !dbg !138
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !138
  %10 = bitcast i32* %arraydecay to i8*, !dbg !138
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !139
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !140
  %add = add i64 %call, 1, !dbg !141
  %mul = mul i64 %add, 4, !dbg !142
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 16 %10, i64 %mul, i1 false), !dbg !138
  %11 = load i32*, i32** %data, align 8, !dbg !143
  call void @printWLine(i32* %11), !dbg !144
  ret void, !dbg !145
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
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_14.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_14_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_14.c", directory: "/root/SSE-Assessment")
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
!31 = !DILocation(line: 33, column: 18, scope: !30)
!32 = !DILocation(line: 33, column: 8, scope: !15)
!33 = !DILocation(line: 37, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !16, line: 34, column: 5)
!35 = !DILocation(line: 37, column: 14, scope: !34)
!36 = !DILocation(line: 38, column: 9, scope: !34)
!37 = !DILocation(line: 38, column: 17, scope: !34)
!38 = !DILocation(line: 39, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !16, line: 41, type: !41)
!40 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DILocation(line: 41, column: 17, scope: !40)
!45 = !DILocation(line: 44, column: 16, scope: !40)
!46 = !DILocation(line: 44, column: 9, scope: !40)
!47 = !DILocation(line: 44, column: 38, scope: !40)
!48 = !DILocation(line: 44, column: 31, scope: !40)
!49 = !DILocation(line: 44, column: 46, scope: !40)
!50 = !DILocation(line: 44, column: 51, scope: !40)
!51 = !DILocation(line: 45, column: 20, scope: !40)
!52 = !DILocation(line: 45, column: 9, scope: !40)
!53 = !DILocation(line: 47, column: 1, scope: !15)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_14_good", scope: !16, file: !16, line: 102, type: !17, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 104, column: 5, scope: !54)
!56 = !DILocation(line: 105, column: 5, scope: !54)
!57 = !DILocation(line: 106, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 118, type: !59, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!7, !7, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !16, line: 118, type: !7)
!65 = !DILocation(line: 118, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !16, line: 118, type: !61)
!67 = !DILocation(line: 118, column: 27, scope: !58)
!68 = !DILocation(line: 121, column: 22, scope: !58)
!69 = !DILocation(line: 121, column: 12, scope: !58)
!70 = !DILocation(line: 121, column: 5, scope: !58)
!71 = !DILocation(line: 123, column: 5, scope: !58)
!72 = !DILocation(line: 124, column: 5, scope: !58)
!73 = !DILocation(line: 125, column: 5, scope: !58)
!74 = !DILocation(line: 128, column: 5, scope: !58)
!75 = !DILocation(line: 129, column: 5, scope: !58)
!76 = !DILocation(line: 130, column: 5, scope: !58)
!77 = !DILocation(line: 132, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DILocalVariable(name: "data", scope: !78, file: !16, line: 56, type: !4)
!80 = !DILocation(line: 56, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !16, line: 57, type: !4)
!82 = !DILocation(line: 57, column: 15, scope: !78)
!83 = !DILocation(line: 57, column: 42, scope: !78)
!84 = !DILocation(line: 57, column: 31, scope: !78)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !16, line: 58, type: !4)
!86 = !DILocation(line: 58, column: 15, scope: !78)
!87 = !DILocation(line: 58, column: 43, scope: !78)
!88 = !DILocation(line: 58, column: 32, scope: !78)
!89 = !DILocation(line: 59, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !16, line: 59, column: 8)
!91 = !DILocation(line: 59, column: 18, scope: !90)
!92 = !DILocation(line: 59, column: 8, scope: !78)
!93 = !DILocation(line: 62, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !16, line: 60, column: 5)
!95 = !DILocation(line: 63, column: 5, scope: !94)
!96 = !DILocation(line: 68, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !16, line: 65, column: 5)
!98 = !DILocation(line: 68, column: 14, scope: !97)
!99 = !DILocation(line: 69, column: 9, scope: !97)
!100 = !DILocation(line: 69, column: 17, scope: !97)
!101 = !DILocalVariable(name: "source", scope: !102, file: !16, line: 72, type: !41)
!102 = distinct !DILexicalBlock(scope: !78, file: !16, line: 71, column: 5)
!103 = !DILocation(line: 72, column: 17, scope: !102)
!104 = !DILocation(line: 75, column: 16, scope: !102)
!105 = !DILocation(line: 75, column: 9, scope: !102)
!106 = !DILocation(line: 75, column: 38, scope: !102)
!107 = !DILocation(line: 75, column: 31, scope: !102)
!108 = !DILocation(line: 75, column: 46, scope: !102)
!109 = !DILocation(line: 75, column: 51, scope: !102)
!110 = !DILocation(line: 76, column: 20, scope: !102)
!111 = !DILocation(line: 76, column: 9, scope: !102)
!112 = !DILocation(line: 78, column: 1, scope: !78)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 81, type: !17, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!114 = !DILocalVariable(name: "data", scope: !113, file: !16, line: 83, type: !4)
!115 = !DILocation(line: 83, column: 15, scope: !113)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !16, line: 84, type: !4)
!117 = !DILocation(line: 84, column: 15, scope: !113)
!118 = !DILocation(line: 84, column: 42, scope: !113)
!119 = !DILocation(line: 84, column: 31, scope: !113)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !16, line: 85, type: !4)
!121 = !DILocation(line: 85, column: 15, scope: !113)
!122 = !DILocation(line: 85, column: 43, scope: !113)
!123 = !DILocation(line: 85, column: 32, scope: !113)
!124 = !DILocation(line: 86, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !113, file: !16, line: 86, column: 8)
!126 = !DILocation(line: 86, column: 18, scope: !125)
!127 = !DILocation(line: 86, column: 8, scope: !113)
!128 = !DILocation(line: 90, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !16, line: 87, column: 5)
!130 = !DILocation(line: 90, column: 14, scope: !129)
!131 = !DILocation(line: 91, column: 9, scope: !129)
!132 = !DILocation(line: 91, column: 17, scope: !129)
!133 = !DILocation(line: 92, column: 5, scope: !129)
!134 = !DILocalVariable(name: "source", scope: !135, file: !16, line: 94, type: !41)
!135 = distinct !DILexicalBlock(scope: !113, file: !16, line: 93, column: 5)
!136 = !DILocation(line: 94, column: 17, scope: !135)
!137 = !DILocation(line: 97, column: 16, scope: !135)
!138 = !DILocation(line: 97, column: 9, scope: !135)
!139 = !DILocation(line: 97, column: 38, scope: !135)
!140 = !DILocation(line: 97, column: 31, scope: !135)
!141 = !DILocation(line: 97, column: 46, scope: !135)
!142 = !DILocation(line: 97, column: 51, scope: !135)
!143 = !DILocation(line: 98, column: 20, scope: !135)
!144 = !DILocation(line: 98, column: 9, scope: !135)
!145 = !DILocation(line: 100, column: 1, scope: !113)
