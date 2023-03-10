; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67a.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType* %myStruct, metadata !21, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 400, align 16, !dbg !29
  %1 = bitcast i8* %0 to i32*, !dbg !30
  store i32* %1, i32** %dataBuffer, align 8, !dbg !28
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !31
  store i32* %2, i32** %data, align 8, !dbg !32
  %3 = load i32*, i32** %data, align 8, !dbg !33
  %call = call i32* @wmemset(i32* %3, i32 65, i64 99) #4, !dbg !34
  %4 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType* %myStruct, i32 0, i32 0, !dbg !38
  store i32* %5, i32** %structFirst, align 8, !dbg !39
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType* %myStruct, i32 0, i32 0, !dbg !40
  %6 = load i32*, i32** %coerce.dive, align 8, !dbg !40
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67b_badSink(i32* %6), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67b_badSink(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* null) #4, !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 %conv) #4, !dbg !57
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_good(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_bad(), !dbg !62
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !65 {
entry:
  %data = alloca i32*, align 8
  %myStruct = alloca %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType, align 8
  %dataBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType* %myStruct, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = alloca i8, i64 400, align 16, !dbg !72
  %1 = bitcast i8* %0 to i32*, !dbg !73
  store i32* %1, i32** %dataBuffer, align 8, !dbg !71
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !74
  store i32* %2, i32** %data, align 8, !dbg !75
  %3 = load i32*, i32** %data, align 8, !dbg !76
  %call = call i32* @wmemset(i32* %3, i32 65, i64 49) #4, !dbg !77
  %4 = load i32*, i32** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  %5 = load i32*, i32** %data, align 8, !dbg !80
  %structFirst = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType* %myStruct, i32 0, i32 0, !dbg !81
  store i32* %5, i32** %structFirst, align 8, !dbg !82
  %coerce.dive = getelementptr inbounds %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType, %struct._CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType* %myStruct, i32 0, i32 0, !dbg !83
  %6 = load i32*, i32** %coerce.dive, align 8, !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67b_goodG2BSink(i32* %6), !dbg !83
  ret void, !dbg !84
}

declare dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67b_goodG2BSink(i32*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67a.c", directory: "/home/joelyang/SSE-Assessment")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67a.c", directory: "/home/joelyang/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "myStruct", scope: !15, file: !16, line: 40, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType", file: !16, line: 30, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_structType", file: !16, line: 27, size: 64, elements: !24)
!24 = !{!25}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "structFirst", scope: !23, file: !16, line: 29, baseType: !4, size: 64)
!26 = !DILocation(line: 40, column: 86, scope: !15)
!27 = !DILocalVariable(name: "dataBuffer", scope: !15, file: !16, line: 41, type: !4)
!28 = !DILocation(line: 41, column: 15, scope: !15)
!29 = !DILocation(line: 41, column: 39, scope: !15)
!30 = !DILocation(line: 41, column: 28, scope: !15)
!31 = !DILocation(line: 42, column: 12, scope: !15)
!32 = !DILocation(line: 42, column: 10, scope: !15)
!33 = !DILocation(line: 44, column: 13, scope: !15)
!34 = !DILocation(line: 44, column: 5, scope: !15)
!35 = !DILocation(line: 45, column: 5, scope: !15)
!36 = !DILocation(line: 45, column: 17, scope: !15)
!37 = !DILocation(line: 46, column: 28, scope: !15)
!38 = !DILocation(line: 46, column: 14, scope: !15)
!39 = !DILocation(line: 46, column: 26, scope: !15)
!40 = !DILocation(line: 47, column: 5, scope: !15)
!41 = !DILocation(line: 48, column: 1, scope: !15)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_67_good", scope: !16, file: !16, line: 70, type: !17, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!43 = !DILocation(line: 72, column: 5, scope: !42)
!44 = !DILocation(line: 73, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 85, type: !46, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{!7, !7, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !16, line: 85, type: !7)
!52 = !DILocation(line: 85, column: 14, scope: !45)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !16, line: 85, type: !48)
!54 = !DILocation(line: 85, column: 27, scope: !45)
!55 = !DILocation(line: 88, column: 22, scope: !45)
!56 = !DILocation(line: 88, column: 12, scope: !45)
!57 = !DILocation(line: 88, column: 5, scope: !45)
!58 = !DILocation(line: 90, column: 5, scope: !45)
!59 = !DILocation(line: 91, column: 5, scope: !45)
!60 = !DILocation(line: 92, column: 5, scope: !45)
!61 = !DILocation(line: 95, column: 5, scope: !45)
!62 = !DILocation(line: 96, column: 5, scope: !45)
!63 = !DILocation(line: 97, column: 5, scope: !45)
!64 = !DILocation(line: 99, column: 5, scope: !45)
!65 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 57, type: !17, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DILocalVariable(name: "data", scope: !65, file: !16, line: 59, type: !4)
!67 = !DILocation(line: 59, column: 15, scope: !65)
!68 = !DILocalVariable(name: "myStruct", scope: !65, file: !16, line: 60, type: !22)
!69 = !DILocation(line: 60, column: 86, scope: !65)
!70 = !DILocalVariable(name: "dataBuffer", scope: !65, file: !16, line: 61, type: !4)
!71 = !DILocation(line: 61, column: 15, scope: !65)
!72 = !DILocation(line: 61, column: 39, scope: !65)
!73 = !DILocation(line: 61, column: 28, scope: !65)
!74 = !DILocation(line: 62, column: 12, scope: !65)
!75 = !DILocation(line: 62, column: 10, scope: !65)
!76 = !DILocation(line: 64, column: 13, scope: !65)
!77 = !DILocation(line: 64, column: 5, scope: !65)
!78 = !DILocation(line: 65, column: 5, scope: !65)
!79 = !DILocation(line: 65, column: 16, scope: !65)
!80 = !DILocation(line: 66, column: 28, scope: !65)
!81 = !DILocation(line: 66, column: 14, scope: !65)
!82 = !DILocation(line: 66, column: 26, scope: !65)
!83 = !DILocation(line: 67, column: 5, scope: !65)
!84 = !DILocation(line: 68, column: 1, scope: !65)
