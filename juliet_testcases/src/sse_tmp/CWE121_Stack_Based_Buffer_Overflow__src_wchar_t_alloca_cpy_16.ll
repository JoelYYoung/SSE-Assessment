; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_16.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_16_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 400, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBuffer, align 8, !dbg !22
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !25
  store i32* %2, i32** %data, align 8, !dbg !26
  br label %while.body, !dbg !27

while.body:                                       ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !28
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #5, !dbg !30
  %4 = load i32*, i32** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  br label %while.end, !dbg !33

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !39
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !40
  %6 = load i32*, i32** %data, align 8, !dbg !41
  %call1 = call i32* @wcscpy(i32* %arraydecay, i32* %6) #5, !dbg !42
  %7 = load i32*, i32** %data, align 8, !dbg !43
  call void @printWLine(i32* %7), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_16_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* null) #5, !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 %conv) #5, !dbg !61
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_16_good(), !dbg !63
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_16_bad(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 400, align 16, !dbg !74
  %1 = bitcast i8* %0 to i32*, !dbg !75
  store i32* %1, i32** %dataBuffer, align 8, !dbg !73
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !76
  store i32* %2, i32** %data, align 8, !dbg !77
  br label %while.body, !dbg !78

while.body:                                       ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !79
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #5, !dbg !81
  %4 = load i32*, i32** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !83
  br label %while.end, !dbg !84

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !85, metadata !DIExpression()), !dbg !87
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !87
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !88
  %6 = load i32*, i32** %data, align 8, !dbg !89
  %call1 = call i32* @wcscpy(i32* %arraydecay, i32* %6) #5, !dbg !90
  %7 = load i32*, i32** %data, align 8, !dbg !91
  call void @printWLine(i32* %7), !dbg !92
  ret void, !dbg !93
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_16.c", directory: "/root/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_16_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_16.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 39, scope: !15)
!24 = !DILocation(line: 26, column: 28, scope: !15)
!25 = !DILocation(line: 27, column: 12, scope: !15)
!26 = !DILocation(line: 27, column: 10, scope: !15)
!27 = !DILocation(line: 28, column: 5, scope: !15)
!28 = !DILocation(line: 31, column: 17, scope: !29)
!29 = distinct !DILexicalBlock(scope: !15, file: !16, line: 29, column: 5)
!30 = !DILocation(line: 31, column: 9, scope: !29)
!31 = !DILocation(line: 32, column: 9, scope: !29)
!32 = !DILocation(line: 32, column: 21, scope: !29)
!33 = !DILocation(line: 33, column: 9, scope: !29)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !16, line: 36, type: !36)
!35 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 1600, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 36, column: 17, scope: !35)
!40 = !DILocation(line: 38, column: 16, scope: !35)
!41 = !DILocation(line: 38, column: 22, scope: !35)
!42 = !DILocation(line: 38, column: 9, scope: !35)
!43 = !DILocation(line: 39, column: 20, scope: !35)
!44 = !DILocation(line: 39, column: 9, scope: !35)
!45 = !DILocation(line: 41, column: 1, scope: !15)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cpy_16_good", scope: !16, file: !16, line: 68, type: !17, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DILocation(line: 70, column: 5, scope: !46)
!48 = !DILocation(line: 71, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 83, type: !50, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!7, !7, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !16, line: 83, type: !7)
!56 = !DILocation(line: 83, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !16, line: 83, type: !52)
!58 = !DILocation(line: 83, column: 27, scope: !49)
!59 = !DILocation(line: 86, column: 22, scope: !49)
!60 = !DILocation(line: 86, column: 12, scope: !49)
!61 = !DILocation(line: 86, column: 5, scope: !49)
!62 = !DILocation(line: 88, column: 5, scope: !49)
!63 = !DILocation(line: 89, column: 5, scope: !49)
!64 = !DILocation(line: 90, column: 5, scope: !49)
!65 = !DILocation(line: 93, column: 5, scope: !49)
!66 = !DILocation(line: 94, column: 5, scope: !49)
!67 = !DILocation(line: 95, column: 5, scope: !49)
!68 = !DILocation(line: 97, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 48, type: !17, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocalVariable(name: "data", scope: !69, file: !16, line: 50, type: !4)
!71 = !DILocation(line: 50, column: 15, scope: !69)
!72 = !DILocalVariable(name: "dataBuffer", scope: !69, file: !16, line: 51, type: !4)
!73 = !DILocation(line: 51, column: 15, scope: !69)
!74 = !DILocation(line: 51, column: 39, scope: !69)
!75 = !DILocation(line: 51, column: 28, scope: !69)
!76 = !DILocation(line: 52, column: 12, scope: !69)
!77 = !DILocation(line: 52, column: 10, scope: !69)
!78 = !DILocation(line: 53, column: 5, scope: !69)
!79 = !DILocation(line: 56, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !69, file: !16, line: 54, column: 5)
!81 = !DILocation(line: 56, column: 9, scope: !80)
!82 = !DILocation(line: 57, column: 9, scope: !80)
!83 = !DILocation(line: 57, column: 20, scope: !80)
!84 = !DILocation(line: 58, column: 9, scope: !80)
!85 = !DILocalVariable(name: "dest", scope: !86, file: !16, line: 61, type: !36)
!86 = distinct !DILexicalBlock(scope: !69, file: !16, line: 60, column: 5)
!87 = !DILocation(line: 61, column: 17, scope: !86)
!88 = !DILocation(line: 63, column: 16, scope: !86)
!89 = !DILocation(line: 63, column: 22, scope: !86)
!90 = !DILocation(line: 63, column: 9, scope: !86)
!91 = !DILocation(line: 64, column: 20, scope: !86)
!92 = !DILocation(line: 64, column: 9, scope: !86)
!93 = !DILocation(line: 66, column: 1, scope: !69)
