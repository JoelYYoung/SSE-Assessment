; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_08_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_08_bad() #0 !dbg !15 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_08_bad.source to i8*), i64 44, i1 false), !dbg !43
  %7 = load i32*, i32** %data, align 8, !dbg !44
  %8 = bitcast i32* %7 to i8*, !dbg !45
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !45
  %9 = bitcast i32* %arraydecay to i8*, !dbg !45
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !46
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !47
  %add = add i64 %call2, 1, !dbg !48
  %mul = mul i64 %add, 4, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 %mul, i1 false), !dbg !45
  %10 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %10), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_08_good() #0 !dbg !53 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_08_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_08_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !77 {
entry:
  ret i32 1, !dbg !80
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %0 = alloca i8, i64 40, align 16, !dbg !86
  %1 = bitcast i8* %0 to i32*, !dbg !87
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %2 = alloca i8, i64 44, align 16, !dbg !90
  %3 = bitcast i8* %2 to i32*, !dbg !91
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !89
  %call = call i32 @staticReturnsFalse(), !dbg !92
  %tobool = icmp ne i32 %call, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  br label %if.end, !dbg !97

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !98
  store i32* %4, i32** %data, align 8, !dbg !100
  %5 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !105
  %7 = load i32*, i32** %data, align 8, !dbg !106
  %8 = bitcast i32* %7 to i8*, !dbg !107
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !107
  %9 = bitcast i32* %arraydecay to i8*, !dbg !107
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !108
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !109
  %add = add i64 %call2, 1, !dbg !110
  %mul = mul i64 %add, 4, !dbg !111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 %mul, i1 false), !dbg !107
  %10 = load i32*, i32** %data, align 8, !dbg !112
  call void @printWLine(i32* %10), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !115 {
entry:
  ret i32 0, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %0 = alloca i8, i64 40, align 16, !dbg !122
  %1 = bitcast i8* %0 to i32*, !dbg !123
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %2 = alloca i8, i64 44, align 16, !dbg !126
  %3 = bitcast i8* %2 to i32*, !dbg !127
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !125
  %call = call i32 @staticReturnsTrue(), !dbg !128
  %tobool = icmp ne i32 %call, 0, !dbg !128
  br i1 %tobool, label %if.then, label %if.end, !dbg !130

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !131
  store i32* %4, i32** %data, align 8, !dbg !133
  %5 = load i32*, i32** %data, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !134
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  br label %if.end, !dbg !136

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !137, metadata !DIExpression()), !dbg !139
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !139
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !139
  %7 = load i32*, i32** %data, align 8, !dbg !140
  %8 = bitcast i32* %7 to i8*, !dbg !141
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !141
  %9 = bitcast i32* %arraydecay to i8*, !dbg !141
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !142
  %call2 = call i64 @wcslen(i32* %arraydecay1) #6, !dbg !143
  %add = add i64 %call2, 1, !dbg !144
  %mul = mul i64 %add, 4, !dbg !145
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 16 %9, i64 %mul, i1 false), !dbg !141
  %10 = load i32*, i32** %data, align 8, !dbg !146
  call void @printWLine(i32* %10), !dbg !147
  ret void, !dbg !148
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_08.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_08_bad", scope: !16, file: !16, line: 42, type: !17, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_08.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 44, type: !4)
!20 = !DILocation(line: 44, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 45, type: !4)
!22 = !DILocation(line: 45, column: 15, scope: !15)
!23 = !DILocation(line: 45, column: 42, scope: !15)
!24 = !DILocation(line: 45, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 46, type: !4)
!26 = !DILocation(line: 46, column: 15, scope: !15)
!27 = !DILocation(line: 46, column: 43, scope: !15)
!28 = !DILocation(line: 46, column: 32, scope: !15)
!29 = !DILocation(line: 47, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 47, column: 8)
!31 = !DILocation(line: 47, column: 8, scope: !15)
!32 = !DILocation(line: 51, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 48, column: 5)
!34 = !DILocation(line: 51, column: 14, scope: !33)
!35 = !DILocation(line: 52, column: 9, scope: !33)
!36 = !DILocation(line: 52, column: 17, scope: !33)
!37 = !DILocation(line: 53, column: 5, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 55, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 54, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 352, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 11)
!43 = !DILocation(line: 55, column: 17, scope: !39)
!44 = !DILocation(line: 58, column: 16, scope: !39)
!45 = !DILocation(line: 58, column: 9, scope: !39)
!46 = !DILocation(line: 58, column: 38, scope: !39)
!47 = !DILocation(line: 58, column: 31, scope: !39)
!48 = !DILocation(line: 58, column: 46, scope: !39)
!49 = !DILocation(line: 58, column: 51, scope: !39)
!50 = !DILocation(line: 59, column: 20, scope: !39)
!51 = !DILocation(line: 59, column: 9, scope: !39)
!52 = !DILocation(line: 61, column: 1, scope: !15)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_08_good", scope: !16, file: !16, line: 116, type: !17, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 118, column: 5, scope: !53)
!55 = !DILocation(line: 119, column: 5, scope: !53)
!56 = !DILocation(line: 120, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 132, type: !58, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!58 = !DISubroutineType(types: !59)
!59 = !{!7, !7, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !16, line: 132, type: !7)
!64 = !DILocation(line: 132, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !16, line: 132, type: !60)
!66 = !DILocation(line: 132, column: 27, scope: !57)
!67 = !DILocation(line: 135, column: 22, scope: !57)
!68 = !DILocation(line: 135, column: 12, scope: !57)
!69 = !DILocation(line: 135, column: 5, scope: !57)
!70 = !DILocation(line: 137, column: 5, scope: !57)
!71 = !DILocation(line: 138, column: 5, scope: !57)
!72 = !DILocation(line: 139, column: 5, scope: !57)
!73 = !DILocation(line: 142, column: 5, scope: !57)
!74 = !DILocation(line: 143, column: 5, scope: !57)
!75 = !DILocation(line: 144, column: 5, scope: !57)
!76 = !DILocation(line: 146, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 30, type: !78, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!7}
!80 = !DILocation(line: 32, column: 5, scope: !77)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 68, type: !17, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocalVariable(name: "data", scope: !81, file: !16, line: 70, type: !4)
!83 = !DILocation(line: 70, column: 15, scope: !81)
!84 = !DILocalVariable(name: "dataBadBuffer", scope: !81, file: !16, line: 71, type: !4)
!85 = !DILocation(line: 71, column: 15, scope: !81)
!86 = !DILocation(line: 71, column: 42, scope: !81)
!87 = !DILocation(line: 71, column: 31, scope: !81)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !81, file: !16, line: 72, type: !4)
!89 = !DILocation(line: 72, column: 15, scope: !81)
!90 = !DILocation(line: 72, column: 43, scope: !81)
!91 = !DILocation(line: 72, column: 32, scope: !81)
!92 = !DILocation(line: 73, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !81, file: !16, line: 73, column: 8)
!94 = !DILocation(line: 73, column: 8, scope: !81)
!95 = !DILocation(line: 76, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !16, line: 74, column: 5)
!97 = !DILocation(line: 77, column: 5, scope: !96)
!98 = !DILocation(line: 82, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !16, line: 79, column: 5)
!100 = !DILocation(line: 82, column: 14, scope: !99)
!101 = !DILocation(line: 83, column: 9, scope: !99)
!102 = !DILocation(line: 83, column: 17, scope: !99)
!103 = !DILocalVariable(name: "source", scope: !104, file: !16, line: 86, type: !40)
!104 = distinct !DILexicalBlock(scope: !81, file: !16, line: 85, column: 5)
!105 = !DILocation(line: 86, column: 17, scope: !104)
!106 = !DILocation(line: 89, column: 16, scope: !104)
!107 = !DILocation(line: 89, column: 9, scope: !104)
!108 = !DILocation(line: 89, column: 38, scope: !104)
!109 = !DILocation(line: 89, column: 31, scope: !104)
!110 = !DILocation(line: 89, column: 46, scope: !104)
!111 = !DILocation(line: 89, column: 51, scope: !104)
!112 = !DILocation(line: 90, column: 20, scope: !104)
!113 = !DILocation(line: 90, column: 9, scope: !104)
!114 = !DILocation(line: 92, column: 1, scope: !81)
!115 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 35, type: !78, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocation(line: 37, column: 5, scope: !115)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 95, type: !17, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocalVariable(name: "data", scope: !117, file: !16, line: 97, type: !4)
!119 = !DILocation(line: 97, column: 15, scope: !117)
!120 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !16, line: 98, type: !4)
!121 = !DILocation(line: 98, column: 15, scope: !117)
!122 = !DILocation(line: 98, column: 42, scope: !117)
!123 = !DILocation(line: 98, column: 31, scope: !117)
!124 = !DILocalVariable(name: "dataGoodBuffer", scope: !117, file: !16, line: 99, type: !4)
!125 = !DILocation(line: 99, column: 15, scope: !117)
!126 = !DILocation(line: 99, column: 43, scope: !117)
!127 = !DILocation(line: 99, column: 32, scope: !117)
!128 = !DILocation(line: 100, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !117, file: !16, line: 100, column: 8)
!130 = !DILocation(line: 100, column: 8, scope: !117)
!131 = !DILocation(line: 104, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !16, line: 101, column: 5)
!133 = !DILocation(line: 104, column: 14, scope: !132)
!134 = !DILocation(line: 105, column: 9, scope: !132)
!135 = !DILocation(line: 105, column: 17, scope: !132)
!136 = !DILocation(line: 106, column: 5, scope: !132)
!137 = !DILocalVariable(name: "source", scope: !138, file: !16, line: 108, type: !40)
!138 = distinct !DILexicalBlock(scope: !117, file: !16, line: 107, column: 5)
!139 = !DILocation(line: 108, column: 17, scope: !138)
!140 = !DILocation(line: 111, column: 16, scope: !138)
!141 = !DILocation(line: 111, column: 9, scope: !138)
!142 = !DILocation(line: 111, column: 38, scope: !138)
!143 = !DILocation(line: 111, column: 31, scope: !138)
!144 = !DILocation(line: 111, column: 46, scope: !138)
!145 = !DILocation(line: 111, column: 51, scope: !138)
!146 = !DILocation(line: 112, column: 20, scope: !138)
!147 = !DILocation(line: 112, column: 9, scope: !138)
!148 = !DILocation(line: 114, column: 1, scope: !117)
