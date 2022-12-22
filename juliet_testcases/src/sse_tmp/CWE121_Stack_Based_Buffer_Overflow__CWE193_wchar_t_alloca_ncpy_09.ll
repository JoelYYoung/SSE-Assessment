; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_09.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_09_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_09_bad() #0 !dbg !15 {
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
  %4 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !29
  %tobool = icmp ne i32 %4, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %5, i32** %data, align 8, !dbg !34
  %6 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_09_bad.source to i8*), i64 44, i1 false), !dbg !43
  %8 = load i32*, i32** %data, align 8, !dbg !44
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !45
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !46
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !47
  %add = add i64 %call, 1, !dbg !48
  %call2 = call i32* @wcsncpy(i32* %8, i32* %arraydecay, i64 %add) #7, !dbg !49
  %9 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %9), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_09_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #7, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #7, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_09_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_09_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = alloca i8, i64 40, align 16, !dbg !82
  %1 = bitcast i8* %0 to i32*, !dbg !83
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %2 = alloca i8, i64 44, align 16, !dbg !86
  %3 = bitcast i8* %2 to i32*, !dbg !87
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !85
  %4 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !88
  %tobool = icmp ne i32 %4, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end, !dbg !93

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !94
  store i32* %5, i32** %data, align 8, !dbg !96
  %6 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !99, metadata !DIExpression()), !dbg !101
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !101
  %8 = load i32*, i32** %data, align 8, !dbg !102
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !103
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !104
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !105
  %add = add i64 %call, 1, !dbg !106
  %call2 = call i32* @wcsncpy(i32* %8, i32* %arraydecay, i64 %add) #7, !dbg !107
  %9 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* %9), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 40, align 16, !dbg !116
  %1 = bitcast i8* %0 to i32*, !dbg !117
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %2 = alloca i8, i64 44, align 16, !dbg !120
  %3 = bitcast i8* %2 to i32*, !dbg !121
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !119
  %4 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !122
  %tobool = icmp ne i32 %4, 0, !dbg !122
  br i1 %tobool, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !125
  store i32* %5, i32** %data, align 8, !dbg !127
  %6 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  br label %if.end, !dbg !130

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !133
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !133
  %8 = load i32*, i32** %data, align 8, !dbg !134
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !135
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !136
  %call = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !137
  %add = add i64 %call, 1, !dbg !138
  %call2 = call i32* @wcsncpy(i32* %8, i32* %arraydecay, i64 %add) #7, !dbg !139
  %9 = load i32*, i32** %data, align 8, !dbg !140
  call void @printWLine(i32* %9), !dbg !141
  ret void, !dbg !142
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_09.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_09_bad", scope: !16, file: !16, line: 28, type: !17, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_09.c", directory: "/root/SSE-Assessment")
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
!38 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 11)
!43 = !DILocation(line: 41, column: 17, scope: !39)
!44 = !DILocation(line: 44, column: 17, scope: !39)
!45 = !DILocation(line: 44, column: 23, scope: !39)
!46 = !DILocation(line: 44, column: 38, scope: !39)
!47 = !DILocation(line: 44, column: 31, scope: !39)
!48 = !DILocation(line: 44, column: 46, scope: !39)
!49 = !DILocation(line: 44, column: 9, scope: !39)
!50 = !DILocation(line: 45, column: 20, scope: !39)
!51 = !DILocation(line: 45, column: 9, scope: !39)
!52 = !DILocation(line: 47, column: 1, scope: !15)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_ncpy_09_good", scope: !16, file: !16, line: 102, type: !17, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 104, column: 5, scope: !53)
!55 = !DILocation(line: 105, column: 5, scope: !53)
!56 = !DILocation(line: 106, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 118, type: !58, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!7, !7, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !16, line: 118, type: !7)
!64 = !DILocation(line: 118, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !16, line: 118, type: !60)
!66 = !DILocation(line: 118, column: 27, scope: !57)
!67 = !DILocation(line: 121, column: 22, scope: !57)
!68 = !DILocation(line: 121, column: 12, scope: !57)
!69 = !DILocation(line: 121, column: 5, scope: !57)
!70 = !DILocation(line: 123, column: 5, scope: !57)
!71 = !DILocation(line: 124, column: 5, scope: !57)
!72 = !DILocation(line: 125, column: 5, scope: !57)
!73 = !DILocation(line: 128, column: 5, scope: !57)
!74 = !DILocation(line: 129, column: 5, scope: !57)
!75 = !DILocation(line: 130, column: 5, scope: !57)
!76 = !DILocation(line: 132, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 54, type: !17, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocalVariable(name: "data", scope: !77, file: !16, line: 56, type: !4)
!79 = !DILocation(line: 56, column: 15, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !16, line: 57, type: !4)
!81 = !DILocation(line: 57, column: 15, scope: !77)
!82 = !DILocation(line: 57, column: 42, scope: !77)
!83 = !DILocation(line: 57, column: 31, scope: !77)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !16, line: 58, type: !4)
!85 = !DILocation(line: 58, column: 15, scope: !77)
!86 = !DILocation(line: 58, column: 43, scope: !77)
!87 = !DILocation(line: 58, column: 32, scope: !77)
!88 = !DILocation(line: 59, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !77, file: !16, line: 59, column: 8)
!90 = !DILocation(line: 59, column: 8, scope: !77)
!91 = !DILocation(line: 62, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !16, line: 60, column: 5)
!93 = !DILocation(line: 63, column: 5, scope: !92)
!94 = !DILocation(line: 68, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !16, line: 65, column: 5)
!96 = !DILocation(line: 68, column: 14, scope: !95)
!97 = !DILocation(line: 69, column: 9, scope: !95)
!98 = !DILocation(line: 69, column: 17, scope: !95)
!99 = !DILocalVariable(name: "source", scope: !100, file: !16, line: 72, type: !40)
!100 = distinct !DILexicalBlock(scope: !77, file: !16, line: 71, column: 5)
!101 = !DILocation(line: 72, column: 17, scope: !100)
!102 = !DILocation(line: 75, column: 17, scope: !100)
!103 = !DILocation(line: 75, column: 23, scope: !100)
!104 = !DILocation(line: 75, column: 38, scope: !100)
!105 = !DILocation(line: 75, column: 31, scope: !100)
!106 = !DILocation(line: 75, column: 46, scope: !100)
!107 = !DILocation(line: 75, column: 9, scope: !100)
!108 = !DILocation(line: 76, column: 20, scope: !100)
!109 = !DILocation(line: 76, column: 9, scope: !100)
!110 = !DILocation(line: 78, column: 1, scope: !77)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 81, type: !17, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", scope: !111, file: !16, line: 83, type: !4)
!113 = !DILocation(line: 83, column: 15, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !16, line: 84, type: !4)
!115 = !DILocation(line: 84, column: 15, scope: !111)
!116 = !DILocation(line: 84, column: 42, scope: !111)
!117 = !DILocation(line: 84, column: 31, scope: !111)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !16, line: 85, type: !4)
!119 = !DILocation(line: 85, column: 15, scope: !111)
!120 = !DILocation(line: 85, column: 43, scope: !111)
!121 = !DILocation(line: 85, column: 32, scope: !111)
!122 = !DILocation(line: 86, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !111, file: !16, line: 86, column: 8)
!124 = !DILocation(line: 86, column: 8, scope: !111)
!125 = !DILocation(line: 90, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !16, line: 87, column: 5)
!127 = !DILocation(line: 90, column: 14, scope: !126)
!128 = !DILocation(line: 91, column: 9, scope: !126)
!129 = !DILocation(line: 91, column: 17, scope: !126)
!130 = !DILocation(line: 92, column: 5, scope: !126)
!131 = !DILocalVariable(name: "source", scope: !132, file: !16, line: 94, type: !40)
!132 = distinct !DILexicalBlock(scope: !111, file: !16, line: 93, column: 5)
!133 = !DILocation(line: 94, column: 17, scope: !132)
!134 = !DILocation(line: 97, column: 17, scope: !132)
!135 = !DILocation(line: 97, column: 23, scope: !132)
!136 = !DILocation(line: 97, column: 38, scope: !132)
!137 = !DILocation(line: 97, column: 31, scope: !132)
!138 = !DILocation(line: 97, column: 46, scope: !132)
!139 = !DILocation(line: 97, column: 9, scope: !132)
!140 = !DILocation(line: 98, column: 20, scope: !132)
!141 = !DILocation(line: 98, column: 9, scope: !132)
!142 = !DILocation(line: 100, column: 1, scope: !111)
