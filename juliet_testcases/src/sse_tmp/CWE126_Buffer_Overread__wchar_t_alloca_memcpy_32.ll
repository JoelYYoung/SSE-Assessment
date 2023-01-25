; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_32.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_32_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %data4 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !35
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !39
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !40
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !40
  store i32 0, i32* %arrayidx2, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !42, metadata !DIExpression()), !dbg !44
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !45
  %9 = load i32*, i32** %8, align 8, !dbg !46
  store i32* %9, i32** %data3, align 8, !dbg !44
  %10 = load i32*, i32** %dataBadBuffer, align 8, !dbg !47
  store i32* %10, i32** %data3, align 8, !dbg !48
  %11 = load i32*, i32** %data3, align 8, !dbg !49
  %12 = load i32**, i32*** %dataPtr1, align 8, !dbg !50
  store i32* %11, i32** %12, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i32** %data4, metadata !52, metadata !DIExpression()), !dbg !54
  %13 = load i32**, i32*** %dataPtr2, align 8, !dbg !55
  %14 = load i32*, i32** %13, align 8, !dbg !56
  store i32* %14, i32** %data4, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !57, metadata !DIExpression()), !dbg !62
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !64
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !65
  store i32 0, i32* %arrayidx6, align 4, !dbg !66
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  %15 = bitcast i32* %arraydecay7 to i8*, !dbg !67
  %16 = load i32*, i32** %data4, align 8, !dbg !68
  %17 = bitcast i32* %16 to i8*, !dbg !67
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !69
  %call9 = call i64 @wcslen(i32* %arraydecay8) #7, !dbg !70
  %mul = mul i64 %call9, 4, !dbg !71
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %15, i8* align 4 %17, i64 %mul, i1 false), !dbg !67
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !72
  store i32 0, i32* %arrayidx10, align 4, !dbg !73
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !74
  call void @printWLine(i32* %arraydecay11), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_32_good() #0 !dbg !77 {
entry:
  call void @goodG2B(), !dbg !78
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
  %call = call i64 @time(i64* null) #6, !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 %conv) #6, !dbg !92
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_32_good(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_32_bad(), !dbg !97
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %data4 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !103, metadata !DIExpression()), !dbg !104
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !105, metadata !DIExpression()), !dbg !106
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 200, align 16, !dbg !109
  %1 = bitcast i8* %0 to i32*, !dbg !110
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %2 = alloca i8, i64 400, align 16, !dbg !113
  %3 = bitcast i8* %2 to i32*, !dbg !114
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !112
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !115
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !116
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !119
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !120
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !121
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !121
  store i32 0, i32* %arrayidx2, align 4, !dbg !122
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !123, metadata !DIExpression()), !dbg !125
  %8 = load i32**, i32*** %dataPtr1, align 8, !dbg !126
  %9 = load i32*, i32** %8, align 8, !dbg !127
  store i32* %9, i32** %data3, align 8, !dbg !125
  %10 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !128
  store i32* %10, i32** %data3, align 8, !dbg !129
  %11 = load i32*, i32** %data3, align 8, !dbg !130
  %12 = load i32**, i32*** %dataPtr1, align 8, !dbg !131
  store i32* %11, i32** %12, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i32** %data4, metadata !133, metadata !DIExpression()), !dbg !135
  %13 = load i32**, i32*** %dataPtr2, align 8, !dbg !136
  %14 = load i32*, i32** %13, align 8, !dbg !137
  store i32* %14, i32** %data4, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !138, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !141
  %call5 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !142
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !143
  store i32 0, i32* %arrayidx6, align 4, !dbg !144
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !145
  %15 = bitcast i32* %arraydecay7 to i8*, !dbg !145
  %16 = load i32*, i32** %data4, align 8, !dbg !146
  %17 = bitcast i32* %16 to i8*, !dbg !145
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !147
  %call9 = call i64 @wcslen(i32* %arraydecay8) #7, !dbg !148
  %mul = mul i64 %call9, 4, !dbg !149
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %15, i8* align 4 %17, i64 %mul, i1 false), !dbg !145
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !150
  store i32 0, i32* %arrayidx10, align 4, !dbg !151
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !152
  call void @printWLine(i32* %arraydecay11), !dbg !153
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_32_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_32.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataPtr1", scope: !15, file: !16, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!23 = !DILocation(line: 26, column: 16, scope: !15)
!24 = !DILocalVariable(name: "dataPtr2", scope: !15, file: !16, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 16, scope: !15)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 28, type: !4)
!27 = !DILocation(line: 28, column: 15, scope: !15)
!28 = !DILocation(line: 28, column: 42, scope: !15)
!29 = !DILocation(line: 28, column: 31, scope: !15)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 29, type: !4)
!31 = !DILocation(line: 29, column: 15, scope: !15)
!32 = !DILocation(line: 29, column: 43, scope: !15)
!33 = !DILocation(line: 29, column: 32, scope: !15)
!34 = !DILocation(line: 30, column: 13, scope: !15)
!35 = !DILocation(line: 30, column: 5, scope: !15)
!36 = !DILocation(line: 31, column: 5, scope: !15)
!37 = !DILocation(line: 31, column: 25, scope: !15)
!38 = !DILocation(line: 32, column: 13, scope: !15)
!39 = !DILocation(line: 32, column: 5, scope: !15)
!40 = !DILocation(line: 33, column: 5, scope: !15)
!41 = !DILocation(line: 33, column: 27, scope: !15)
!42 = !DILocalVariable(name: "data", scope: !43, file: !16, line: 35, type: !4)
!43 = distinct !DILexicalBlock(scope: !15, file: !16, line: 34, column: 5)
!44 = !DILocation(line: 35, column: 19, scope: !43)
!45 = !DILocation(line: 35, column: 27, scope: !43)
!46 = !DILocation(line: 35, column: 26, scope: !43)
!47 = !DILocation(line: 37, column: 16, scope: !43)
!48 = !DILocation(line: 37, column: 14, scope: !43)
!49 = !DILocation(line: 38, column: 21, scope: !43)
!50 = !DILocation(line: 38, column: 10, scope: !43)
!51 = !DILocation(line: 38, column: 19, scope: !43)
!52 = !DILocalVariable(name: "data", scope: !53, file: !16, line: 41, type: !4)
!53 = distinct !DILexicalBlock(scope: !15, file: !16, line: 40, column: 5)
!54 = !DILocation(line: 41, column: 19, scope: !53)
!55 = !DILocation(line: 41, column: 27, scope: !53)
!56 = !DILocation(line: 41, column: 26, scope: !53)
!57 = !DILocalVariable(name: "dest", scope: !58, file: !16, line: 43, type: !59)
!58 = distinct !DILexicalBlock(scope: !53, file: !16, line: 42, column: 9)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 100)
!62 = !DILocation(line: 43, column: 21, scope: !58)
!63 = !DILocation(line: 44, column: 21, scope: !58)
!64 = !DILocation(line: 44, column: 13, scope: !58)
!65 = !DILocation(line: 45, column: 13, scope: !58)
!66 = !DILocation(line: 45, column: 25, scope: !58)
!67 = !DILocation(line: 48, column: 13, scope: !58)
!68 = !DILocation(line: 48, column: 26, scope: !58)
!69 = !DILocation(line: 48, column: 39, scope: !58)
!70 = !DILocation(line: 48, column: 32, scope: !58)
!71 = !DILocation(line: 48, column: 44, scope: !58)
!72 = !DILocation(line: 49, column: 13, scope: !58)
!73 = !DILocation(line: 49, column: 25, scope: !58)
!74 = !DILocation(line: 50, column: 24, scope: !58)
!75 = !DILocation(line: 50, column: 13, scope: !58)
!76 = !DILocation(line: 53, column: 1, scope: !15)
!77 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_32_good", scope: !16, file: !16, line: 92, type: !17, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DILocation(line: 94, column: 5, scope: !77)
!79 = !DILocation(line: 95, column: 1, scope: !77)
!80 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 106, type: !81, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !82)
!82 = !{!7, !7, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !16, line: 106, type: !7)
!87 = !DILocation(line: 106, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !16, line: 106, type: !83)
!89 = !DILocation(line: 106, column: 27, scope: !80)
!90 = !DILocation(line: 109, column: 22, scope: !80)
!91 = !DILocation(line: 109, column: 12, scope: !80)
!92 = !DILocation(line: 109, column: 5, scope: !80)
!93 = !DILocation(line: 111, column: 5, scope: !80)
!94 = !DILocation(line: 112, column: 5, scope: !80)
!95 = !DILocation(line: 113, column: 5, scope: !80)
!96 = !DILocation(line: 116, column: 5, scope: !80)
!97 = !DILocation(line: 117, column: 5, scope: !80)
!98 = !DILocation(line: 118, column: 5, scope: !80)
!99 = !DILocation(line: 120, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!101 = !DILocalVariable(name: "data", scope: !100, file: !16, line: 62, type: !4)
!102 = !DILocation(line: 62, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataPtr1", scope: !100, file: !16, line: 63, type: !22)
!104 = !DILocation(line: 63, column: 16, scope: !100)
!105 = !DILocalVariable(name: "dataPtr2", scope: !100, file: !16, line: 64, type: !22)
!106 = !DILocation(line: 64, column: 16, scope: !100)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !16, line: 65, type: !4)
!108 = !DILocation(line: 65, column: 15, scope: !100)
!109 = !DILocation(line: 65, column: 42, scope: !100)
!110 = !DILocation(line: 65, column: 31, scope: !100)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !16, line: 66, type: !4)
!112 = !DILocation(line: 66, column: 15, scope: !100)
!113 = !DILocation(line: 66, column: 43, scope: !100)
!114 = !DILocation(line: 66, column: 32, scope: !100)
!115 = !DILocation(line: 67, column: 13, scope: !100)
!116 = !DILocation(line: 67, column: 5, scope: !100)
!117 = !DILocation(line: 68, column: 5, scope: !100)
!118 = !DILocation(line: 68, column: 25, scope: !100)
!119 = !DILocation(line: 69, column: 13, scope: !100)
!120 = !DILocation(line: 69, column: 5, scope: !100)
!121 = !DILocation(line: 70, column: 5, scope: !100)
!122 = !DILocation(line: 70, column: 27, scope: !100)
!123 = !DILocalVariable(name: "data", scope: !124, file: !16, line: 72, type: !4)
!124 = distinct !DILexicalBlock(scope: !100, file: !16, line: 71, column: 5)
!125 = !DILocation(line: 72, column: 19, scope: !124)
!126 = !DILocation(line: 72, column: 27, scope: !124)
!127 = !DILocation(line: 72, column: 26, scope: !124)
!128 = !DILocation(line: 74, column: 16, scope: !124)
!129 = !DILocation(line: 74, column: 14, scope: !124)
!130 = !DILocation(line: 75, column: 21, scope: !124)
!131 = !DILocation(line: 75, column: 10, scope: !124)
!132 = !DILocation(line: 75, column: 19, scope: !124)
!133 = !DILocalVariable(name: "data", scope: !134, file: !16, line: 78, type: !4)
!134 = distinct !DILexicalBlock(scope: !100, file: !16, line: 77, column: 5)
!135 = !DILocation(line: 78, column: 19, scope: !134)
!136 = !DILocation(line: 78, column: 27, scope: !134)
!137 = !DILocation(line: 78, column: 26, scope: !134)
!138 = !DILocalVariable(name: "dest", scope: !139, file: !16, line: 80, type: !59)
!139 = distinct !DILexicalBlock(scope: !134, file: !16, line: 79, column: 9)
!140 = !DILocation(line: 80, column: 21, scope: !139)
!141 = !DILocation(line: 81, column: 21, scope: !139)
!142 = !DILocation(line: 81, column: 13, scope: !139)
!143 = !DILocation(line: 82, column: 13, scope: !139)
!144 = !DILocation(line: 82, column: 25, scope: !139)
!145 = !DILocation(line: 85, column: 13, scope: !139)
!146 = !DILocation(line: 85, column: 26, scope: !139)
!147 = !DILocation(line: 85, column: 39, scope: !139)
!148 = !DILocation(line: 85, column: 32, scope: !139)
!149 = !DILocation(line: 85, column: 44, scope: !139)
!150 = !DILocation(line: 86, column: 13, scope: !139)
!151 = !DILocation(line: 86, column: 25, scope: !139)
!152 = !DILocation(line: 87, column: 24, scope: !139)
!153 = !DILocation(line: 87, column: 13, scope: !139)
!154 = !DILocation(line: 90, column: 1, scope: !100)
