; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_15.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_15_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !30
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !34
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !35
  store i32 0, i32* %arrayidx2, align 4, !dbg !36
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  store i32* %8, i32** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !45
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !46
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx4, align 4, !dbg !48
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !49
  %9 = bitcast i32* %arraydecay5 to i8*, !dbg !49
  %10 = load i32*, i32** %data, align 8, !dbg !50
  %11 = bitcast i32* %10 to i8*, !dbg !49
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !52
  %mul = mul i64 %call7, 4, !dbg !53
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %9, i8* align 4 %11, i64 %mul, i1 false), !dbg !49
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx8, align 4, !dbg !55
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  call void @printWLine(i32* %arraydecay9), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_15_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #6, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #6, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_15_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_15_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 200, align 16, !dbg !88
  %1 = bitcast i8* %0 to i32*, !dbg !89
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %2 = alloca i8, i64 400, align 16, !dbg !92
  %3 = bitcast i8* %2 to i32*, !dbg !93
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !91
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !94
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !95
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !98
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !99
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !100
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !100
  store i32 0, i32* %arrayidx2, align 4, !dbg !101
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !102
  store i32* %8, i32** %data, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !107
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !108
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx4, align 4, !dbg !110
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !111
  %9 = bitcast i32* %arraydecay5 to i8*, !dbg !111
  %10 = load i32*, i32** %data, align 8, !dbg !112
  %11 = bitcast i32* %10 to i8*, !dbg !111
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !113
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !114
  %mul = mul i64 %call7, 4, !dbg !115
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %9, i8* align 4 %11, i64 %mul, i1 false), !dbg !111
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !116
  store i32 0, i32* %arrayidx8, align 4, !dbg !117
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  call void @printWLine(i32* %arraydecay9), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !121 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %0 = alloca i8, i64 200, align 16, !dbg !126
  %1 = bitcast i8* %0 to i32*, !dbg !127
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  %2 = alloca i8, i64 400, align 16, !dbg !130
  %3 = bitcast i8* %2 to i32*, !dbg !131
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !129
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !132
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !133
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !134
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !136
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !137
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !138
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !138
  store i32 0, i32* %arrayidx2, align 4, !dbg !139
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !140
  store i32* %8, i32** %data, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !142, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !145
  %call3 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !146
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !147
  store i32 0, i32* %arrayidx4, align 4, !dbg !148
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !149
  %9 = bitcast i32* %arraydecay5 to i8*, !dbg !149
  %10 = load i32*, i32** %data, align 8, !dbg !150
  %11 = bitcast i32* %10 to i8*, !dbg !149
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !151
  %call7 = call i64 @wcslen(i32* %arraydecay6) #7, !dbg !152
  %mul = mul i64 %call7, 4, !dbg !153
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %9, i8* align 4 %11, i64 %mul, i1 false), !dbg !149
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !154
  store i32 0, i32* %arrayidx8, align 4, !dbg !155
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !156
  call void @printWLine(i32* %arraydecay9), !dbg !157
  ret void, !dbg !158
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_15.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_15_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memmove_15.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 28, column: 13, scope: !15)
!30 = !DILocation(line: 28, column: 5, scope: !15)
!31 = !DILocation(line: 29, column: 5, scope: !15)
!32 = !DILocation(line: 29, column: 25, scope: !15)
!33 = !DILocation(line: 30, column: 13, scope: !15)
!34 = !DILocation(line: 30, column: 5, scope: !15)
!35 = !DILocation(line: 31, column: 5, scope: !15)
!36 = !DILocation(line: 31, column: 27, scope: !15)
!37 = !DILocation(line: 36, column: 16, scope: !15)
!38 = !DILocation(line: 36, column: 14, scope: !15)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !16, line: 44, type: !41)
!40 = distinct !DILexicalBlock(scope: !15, file: !16, line: 43, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 44, column: 17, scope: !40)
!45 = !DILocation(line: 45, column: 17, scope: !40)
!46 = !DILocation(line: 45, column: 9, scope: !40)
!47 = !DILocation(line: 46, column: 9, scope: !40)
!48 = !DILocation(line: 46, column: 21, scope: !40)
!49 = !DILocation(line: 49, column: 9, scope: !40)
!50 = !DILocation(line: 49, column: 23, scope: !40)
!51 = !DILocation(line: 49, column: 36, scope: !40)
!52 = !DILocation(line: 49, column: 29, scope: !40)
!53 = !DILocation(line: 49, column: 41, scope: !40)
!54 = !DILocation(line: 50, column: 9, scope: !40)
!55 = !DILocation(line: 50, column: 21, scope: !40)
!56 = !DILocation(line: 51, column: 20, scope: !40)
!57 = !DILocation(line: 51, column: 9, scope: !40)
!58 = !DILocation(line: 53, column: 1, scope: !15)
!59 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_15_good", scope: !16, file: !16, line: 125, type: !17, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 127, column: 5, scope: !59)
!61 = !DILocation(line: 128, column: 5, scope: !59)
!62 = !DILocation(line: 129, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 141, type: !64, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!7, !7, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !16, line: 141, type: !7)
!70 = !DILocation(line: 141, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !16, line: 141, type: !66)
!72 = !DILocation(line: 141, column: 27, scope: !63)
!73 = !DILocation(line: 144, column: 22, scope: !63)
!74 = !DILocation(line: 144, column: 12, scope: !63)
!75 = !DILocation(line: 144, column: 5, scope: !63)
!76 = !DILocation(line: 146, column: 5, scope: !63)
!77 = !DILocation(line: 147, column: 5, scope: !63)
!78 = !DILocation(line: 148, column: 5, scope: !63)
!79 = !DILocation(line: 151, column: 5, scope: !63)
!80 = !DILocation(line: 152, column: 5, scope: !63)
!81 = !DILocation(line: 153, column: 5, scope: !63)
!82 = !DILocation(line: 155, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "data", scope: !83, file: !16, line: 62, type: !4)
!85 = !DILocation(line: 62, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !16, line: 63, type: !4)
!87 = !DILocation(line: 63, column: 15, scope: !83)
!88 = !DILocation(line: 63, column: 42, scope: !83)
!89 = !DILocation(line: 63, column: 31, scope: !83)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !16, line: 64, type: !4)
!91 = !DILocation(line: 64, column: 15, scope: !83)
!92 = !DILocation(line: 64, column: 43, scope: !83)
!93 = !DILocation(line: 64, column: 32, scope: !83)
!94 = !DILocation(line: 65, column: 13, scope: !83)
!95 = !DILocation(line: 65, column: 5, scope: !83)
!96 = !DILocation(line: 66, column: 5, scope: !83)
!97 = !DILocation(line: 66, column: 25, scope: !83)
!98 = !DILocation(line: 67, column: 13, scope: !83)
!99 = !DILocation(line: 67, column: 5, scope: !83)
!100 = !DILocation(line: 68, column: 5, scope: !83)
!101 = !DILocation(line: 68, column: 27, scope: !83)
!102 = !DILocation(line: 77, column: 16, scope: !83)
!103 = !DILocation(line: 77, column: 14, scope: !83)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !16, line: 81, type: !41)
!105 = distinct !DILexicalBlock(scope: !83, file: !16, line: 80, column: 5)
!106 = !DILocation(line: 81, column: 17, scope: !105)
!107 = !DILocation(line: 82, column: 17, scope: !105)
!108 = !DILocation(line: 82, column: 9, scope: !105)
!109 = !DILocation(line: 83, column: 9, scope: !105)
!110 = !DILocation(line: 83, column: 21, scope: !105)
!111 = !DILocation(line: 86, column: 9, scope: !105)
!112 = !DILocation(line: 86, column: 23, scope: !105)
!113 = !DILocation(line: 86, column: 36, scope: !105)
!114 = !DILocation(line: 86, column: 29, scope: !105)
!115 = !DILocation(line: 86, column: 41, scope: !105)
!116 = !DILocation(line: 87, column: 9, scope: !105)
!117 = !DILocation(line: 87, column: 21, scope: !105)
!118 = !DILocation(line: 88, column: 20, scope: !105)
!119 = !DILocation(line: 88, column: 9, scope: !105)
!120 = !DILocation(line: 90, column: 1, scope: !83)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 93, type: !17, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", scope: !121, file: !16, line: 95, type: !4)
!123 = !DILocation(line: 95, column: 15, scope: !121)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !121, file: !16, line: 96, type: !4)
!125 = !DILocation(line: 96, column: 15, scope: !121)
!126 = !DILocation(line: 96, column: 42, scope: !121)
!127 = !DILocation(line: 96, column: 31, scope: !121)
!128 = !DILocalVariable(name: "dataGoodBuffer", scope: !121, file: !16, line: 97, type: !4)
!129 = !DILocation(line: 97, column: 15, scope: !121)
!130 = !DILocation(line: 97, column: 43, scope: !121)
!131 = !DILocation(line: 97, column: 32, scope: !121)
!132 = !DILocation(line: 98, column: 13, scope: !121)
!133 = !DILocation(line: 98, column: 5, scope: !121)
!134 = !DILocation(line: 99, column: 5, scope: !121)
!135 = !DILocation(line: 99, column: 25, scope: !121)
!136 = !DILocation(line: 100, column: 13, scope: !121)
!137 = !DILocation(line: 100, column: 5, scope: !121)
!138 = !DILocation(line: 101, column: 5, scope: !121)
!139 = !DILocation(line: 101, column: 27, scope: !121)
!140 = !DILocation(line: 106, column: 16, scope: !121)
!141 = !DILocation(line: 106, column: 14, scope: !121)
!142 = !DILocalVariable(name: "dest", scope: !143, file: !16, line: 114, type: !41)
!143 = distinct !DILexicalBlock(scope: !121, file: !16, line: 113, column: 5)
!144 = !DILocation(line: 114, column: 17, scope: !143)
!145 = !DILocation(line: 115, column: 17, scope: !143)
!146 = !DILocation(line: 115, column: 9, scope: !143)
!147 = !DILocation(line: 116, column: 9, scope: !143)
!148 = !DILocation(line: 116, column: 21, scope: !143)
!149 = !DILocation(line: 119, column: 9, scope: !143)
!150 = !DILocation(line: 119, column: 23, scope: !143)
!151 = !DILocation(line: 119, column: 36, scope: !143)
!152 = !DILocation(line: 119, column: 29, scope: !143)
!153 = !DILocation(line: 119, column: 41, scope: !143)
!154 = !DILocation(line: 120, column: 9, scope: !143)
!155 = !DILocation(line: 120, column: 21, scope: !143)
!156 = !DILocation(line: 121, column: 20, scope: !143)
!157 = !DILocation(line: 121, column: 9, scope: !143)
!158 = !DILocation(line: 123, column: 1, scope: !121)
