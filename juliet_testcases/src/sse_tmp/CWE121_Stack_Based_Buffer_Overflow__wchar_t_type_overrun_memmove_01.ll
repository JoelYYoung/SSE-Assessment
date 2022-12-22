; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01_bad() #0 !dbg !16 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !20, metadata !DIExpression()), !dbg !31
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !32
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !33
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !34
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !34
  %1 = bitcast i8* %0 to i32*, !dbg !35
  call void @printWLine(i32* %1), !dbg !36
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !37
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !38
  %2 = bitcast i32* %arraydecay to i8*, !dbg !38
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !38
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !39
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !42
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !43
  call void @printWLine(i32* %arraydecay4), !dbg !44
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !45
  %3 = load i8*, i8** %voidSecond5, align 8, !dbg !45
  %4 = bitcast i8* %3 to i32*, !dbg !46
  call void @printWLine(i32* %4), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @printWLine(i32*) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01_good() #0 !dbg !49 {
entry:
  call void @good1(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #5, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #5, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !72 {
entry:
  %structCharVoid = alloca %struct._charVoid, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid* %structCharVoid, metadata !73, metadata !DIExpression()), !dbg !75
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !76
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !77
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !78
  %0 = load i8*, i8** %voidSecond1, align 8, !dbg !78
  %1 = bitcast i8* %0 to i32*, !dbg !79
  call void @printWLine(i32* %1), !dbg !80
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !81
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !82
  %2 = bitcast i32* %arraydecay to i8*, !dbg !82
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %2, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !82
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !83
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !84
  store i32 0, i32* %arrayidx, align 4, !dbg !85
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 0, !dbg !86
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !87
  call void @printWLine(i32* %arraydecay4), !dbg !88
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %structCharVoid, i32 0, i32 1, !dbg !89
  %3 = load i8*, i8** %voidSecond5, align 8, !dbg !89
  %4 = bitcast i8* %3 to i32*, !dbg !90
  call void @printWLine(i32* %4), !dbg !91
  ret void, !dbg !92
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !5, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 74, baseType: !8)
!7 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01_bad", scope: !17, file: !17, line: 34, type: !18, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "structCharVoid", scope: !21, file: !17, line: 37, type: !22)
!21 = distinct !DILexicalBlock(scope: !16, file: !17, line: 36, column: 5)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !17, line: 30, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !17, line: 25, size: 640, elements: !24)
!24 = !{!25, !29, !30}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !23, file: !17, line: 27, baseType: !26, size: 512)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 512, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 16)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !23, file: !17, line: 28, baseType: !4, size: 64, offset: 512)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !23, file: !17, line: 29, baseType: !4, size: 64, offset: 576)
!31 = !DILocation(line: 37, column: 18, scope: !21)
!32 = !DILocation(line: 38, column: 24, scope: !21)
!33 = !DILocation(line: 38, column: 35, scope: !21)
!34 = !DILocation(line: 40, column: 46, scope: !21)
!35 = !DILocation(line: 40, column: 20, scope: !21)
!36 = !DILocation(line: 40, column: 9, scope: !21)
!37 = !DILocation(line: 42, column: 32, scope: !21)
!38 = !DILocation(line: 42, column: 9, scope: !21)
!39 = !DILocation(line: 43, column: 24, scope: !21)
!40 = !DILocation(line: 43, column: 9, scope: !21)
!41 = !DILocation(line: 43, column: 88, scope: !21)
!42 = !DILocation(line: 44, column: 46, scope: !21)
!43 = !DILocation(line: 44, column: 31, scope: !21)
!44 = !DILocation(line: 44, column: 9, scope: !21)
!45 = !DILocation(line: 45, column: 46, scope: !21)
!46 = !DILocation(line: 45, column: 20, scope: !21)
!47 = !DILocation(line: 45, column: 9, scope: !21)
!48 = !DILocation(line: 47, column: 1, scope: !16)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01_good", scope: !17, file: !17, line: 68, type: !18, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DILocation(line: 70, column: 5, scope: !49)
!51 = !DILocation(line: 71, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 82, type: !53, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!53 = !DISubroutineType(types: !54)
!54 = !{!8, !8, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !17, line: 82, type: !8)
!59 = !DILocation(line: 82, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !17, line: 82, type: !55)
!61 = !DILocation(line: 82, column: 27, scope: !52)
!62 = !DILocation(line: 85, column: 22, scope: !52)
!63 = !DILocation(line: 85, column: 12, scope: !52)
!64 = !DILocation(line: 85, column: 5, scope: !52)
!65 = !DILocation(line: 87, column: 5, scope: !52)
!66 = !DILocation(line: 88, column: 5, scope: !52)
!67 = !DILocation(line: 89, column: 5, scope: !52)
!68 = !DILocation(line: 92, column: 5, scope: !52)
!69 = !DILocation(line: 93, column: 5, scope: !52)
!70 = !DILocation(line: 94, column: 5, scope: !52)
!71 = !DILocation(line: 96, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "good1", scope: !17, file: !17, line: 53, type: !18, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: "structCharVoid", scope: !74, file: !17, line: 56, type: !22)
!74 = distinct !DILexicalBlock(scope: !72, file: !17, line: 55, column: 5)
!75 = !DILocation(line: 56, column: 18, scope: !74)
!76 = !DILocation(line: 57, column: 24, scope: !74)
!77 = !DILocation(line: 57, column: 35, scope: !74)
!78 = !DILocation(line: 59, column: 46, scope: !74)
!79 = !DILocation(line: 59, column: 20, scope: !74)
!80 = !DILocation(line: 59, column: 9, scope: !74)
!81 = !DILocation(line: 61, column: 32, scope: !74)
!82 = !DILocation(line: 61, column: 9, scope: !74)
!83 = !DILocation(line: 62, column: 24, scope: !74)
!84 = !DILocation(line: 62, column: 9, scope: !74)
!85 = !DILocation(line: 62, column: 88, scope: !74)
!86 = !DILocation(line: 63, column: 46, scope: !74)
!87 = !DILocation(line: 63, column: 31, scope: !74)
!88 = !DILocation(line: 63, column: 9, scope: !74)
!89 = !DILocation(line: 64, column: 46, scope: !74)
!90 = !DILocation(line: 64, column: 20, scope: !74)
!91 = !DILocation(line: 64, column: 9, scope: !74)
!92 = !DILocation(line: 66, column: 1, scope: !72)
