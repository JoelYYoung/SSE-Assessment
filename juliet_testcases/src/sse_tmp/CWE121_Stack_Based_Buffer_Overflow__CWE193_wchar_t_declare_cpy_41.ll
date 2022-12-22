; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_badSink(i32* %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !26
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_badSink.source to i8*), i64 44, i1 false), !dbg !26
  %1 = load i32*, i32** %data.addr, align 8, !dbg !27
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !28
  %call = call i32* @wcscpy(i32* %1, i32* %arraydecay) #5, !dbg !29
  %2 = load i32*, i32** %data.addr, align 8, !dbg !30
  call void @printWLine(i32* %2), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_bad() #0 !dbg !33 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !43, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !45
  store i32* %arraydecay, i32** %data, align 8, !dbg !46
  %0 = load i32*, i32** %data, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !47
  store i32 0, i32* %arrayidx, align 4, !dbg !48
  %1 = load i32*, i32** %data, align 8, !dbg !49
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_badSink(i32* %1), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_goodG2BSink(i32* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !55, metadata !DIExpression()), !dbg !57
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !57
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_goodG2BSink.source to i8*), i64 44, i1 false), !dbg !57
  %1 = load i32*, i32** %data.addr, align 8, !dbg !58
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !59
  %call = call i32* @wcscpy(i32* %1, i32* %arraydecay) #5, !dbg !60
  %2 = load i32*, i32** %data.addr, align 8, !dbg !61
  call void @printWLine(i32* %2), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* null) #5, !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 %conv) #5, !dbg !79
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_good(), !dbg !81
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_bad(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !94
  store i32* %arraydecay, i32** %data, align 8, !dbg !95
  %0 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  %1 = load i32*, i32** %data, align 8, !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_goodG2BSink(i32* %1), !dbg !99
  ret void, !dbg !100
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_badSink", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 74, baseType: !18)
!17 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 28, type: !15)
!20 = !DILocation(line: 28, column: 90, scope: !11)
!21 = !DILocalVariable(name: "source", scope: !22, file: !12, line: 31, type: !23)
!22 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 352, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 11)
!26 = !DILocation(line: 31, column: 17, scope: !22)
!27 = !DILocation(line: 33, column: 16, scope: !22)
!28 = !DILocation(line: 33, column: 22, scope: !22)
!29 = !DILocation(line: 33, column: 9, scope: !22)
!30 = !DILocation(line: 34, column: 20, scope: !22)
!31 = !DILocation(line: 34, column: 9, scope: !22)
!32 = !DILocation(line: 36, column: 1, scope: !11)
!33 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_bad", scope: !12, file: !12, line: 38, type: !34, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !DILocalVariable(name: "data", scope: !33, file: !12, line: 40, type: !15)
!37 = !DILocation(line: 40, column: 15, scope: !33)
!38 = !DILocalVariable(name: "dataBadBuffer", scope: !33, file: !12, line: 41, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 10)
!42 = !DILocation(line: 41, column: 13, scope: !33)
!43 = !DILocalVariable(name: "dataGoodBuffer", scope: !33, file: !12, line: 42, type: !23)
!44 = !DILocation(line: 42, column: 13, scope: !33)
!45 = !DILocation(line: 45, column: 12, scope: !33)
!46 = !DILocation(line: 45, column: 10, scope: !33)
!47 = !DILocation(line: 46, column: 5, scope: !33)
!48 = !DILocation(line: 46, column: 13, scope: !33)
!49 = !DILocation(line: 47, column: 79, scope: !33)
!50 = !DILocation(line: 47, column: 5, scope: !33)
!51 = !DILocation(line: 48, column: 1, scope: !33)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_goodG2BSink", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !12, line: 54, type: !15)
!54 = !DILocation(line: 54, column: 94, scope: !52)
!55 = !DILocalVariable(name: "source", scope: !56, file: !12, line: 57, type: !23)
!56 = distinct !DILexicalBlock(scope: !52, file: !12, line: 56, column: 5)
!57 = !DILocation(line: 57, column: 17, scope: !56)
!58 = !DILocation(line: 59, column: 16, scope: !56)
!59 = !DILocation(line: 59, column: 22, scope: !56)
!60 = !DILocation(line: 59, column: 9, scope: !56)
!61 = !DILocation(line: 60, column: 20, scope: !56)
!62 = !DILocation(line: 60, column: 9, scope: !56)
!63 = !DILocation(line: 62, column: 1, scope: !52)
!64 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_cpy_41_good", scope: !12, file: !12, line: 77, type: !34, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 79, column: 5, scope: !64)
!66 = !DILocation(line: 80, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !68, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{!18, !18, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !12, line: 92, type: !18)
!74 = !DILocation(line: 92, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !12, line: 92, type: !70)
!76 = !DILocation(line: 92, column: 27, scope: !67)
!77 = !DILocation(line: 95, column: 22, scope: !67)
!78 = !DILocation(line: 95, column: 12, scope: !67)
!79 = !DILocation(line: 95, column: 5, scope: !67)
!80 = !DILocation(line: 97, column: 5, scope: !67)
!81 = !DILocation(line: 98, column: 5, scope: !67)
!82 = !DILocation(line: 99, column: 5, scope: !67)
!83 = !DILocation(line: 102, column: 5, scope: !67)
!84 = !DILocation(line: 103, column: 5, scope: !67)
!85 = !DILocation(line: 104, column: 5, scope: !67)
!86 = !DILocation(line: 106, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 65, type: !34, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 67, type: !15)
!89 = !DILocation(line: 67, column: 15, scope: !87)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !87, file: !12, line: 68, type: !39)
!91 = !DILocation(line: 68, column: 13, scope: !87)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !87, file: !12, line: 69, type: !23)
!93 = !DILocation(line: 69, column: 13, scope: !87)
!94 = !DILocation(line: 72, column: 12, scope: !87)
!95 = !DILocation(line: 72, column: 10, scope: !87)
!96 = !DILocation(line: 73, column: 5, scope: !87)
!97 = !DILocation(line: 73, column: 13, scope: !87)
!98 = !DILocation(line: 74, column: 83, scope: !87)
!99 = !DILocation(line: 74, column: 5, scope: !87)
!100 = !DILocation(line: 75, column: 1, scope: !87)
